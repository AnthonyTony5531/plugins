/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-31
 * 模拟换页
 * -------------------------------------------------------
 *   版本          修改人            说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/logger.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';

class MokaPage extends StatefulWidget {
  final int count;
  final int index;
  final Widget defaultView;
  final Widget child;
  final ValueChanged<int> onPageChanged;
  final OnMoveOver onMoveOver;
  MokaPage({Key key, 
    this.count = 1, 
    this.index = 0, 
    this.defaultView, 
    this.child, 
    this.onPageChanged, 
    this.onMoveOver
  }) : super(key: key);

  @override
  _MokaPageState createState() => _MokaPageState();
}

class _MokaPageState extends State<MokaPage> {
  PageController _controller = PageController();
  int currentPage = -1;
  @override
  void initState() {
    _controller.addListener(onPageListener);
    super.initState();
  }

  @override
  void didUpdateWidget(MokaPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    updatePage();
    var body = widget.child;
    return PageView(
      //physics: AlwaysScrollableScrollPhysics(),
      controller: _controller,
      onPageChanged: widget.onPageChanged,
      children: List<Widget>.generate(widget.count, (i){
        if(currentPage == i){
          return body??Text("$i");
        }else if(widget.defaultView != null){
          return widget.defaultView;
        }else{
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: config.skin.list.backgroundColor,
            child: Text("$i")
          );
        }
      })
    );
  }

  Future updatePage()async{
    await sleep(10);
    if(!mounted)return;
    if(currentPage == widget.index)
      return;
    
    setState(() {
        try{
            currentPage = widget.index;
            var viewPage = ((_controller.page??0)).floor();
            var isFullPage = ((_controller.page??0) * 10)%10 == 0;
            if(isFullPage && currentPage != viewPage){
              _controller.jumpToPage(currentPage);
            }
        }catch(e){
          logError(e);
        }
    });
  }

  onPageListener(){
    var width = (widget.count - 1) * MediaQuery.of(context).size.width;
    //logInfo("message ${_controller.page} offset:${_controller.offset} width:$width");
    var size = 0;
    if(_controller.offset < -size){
      fireMovePosition(OverPosition.Start, _controller.offset);
    }else if(_controller.offset - width > size){
      fireMovePosition(OverPosition.End, _controller.offset - width);
    }
  }

  fireMovePosition(OverPosition overPosition, double offset){
    if(widget.onMoveOver != null){
      widget.onMoveOver(overPosition, offset);
    }
  }
}

enum OverPosition{
  Start,
  End
}

typedef void OnMoveOver(OverPosition overPosition, double offset);

