import 'package:dio/dio.dart';
import 'package:fast_ai/api/protocols/aigames/ai_game_url_protocol.dart';
import 'package:fast_ai/config/config.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/module/common/widget/loading_dialog.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/pages/new_user_course/new_user_course_page.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatroomGameSubPage extends StatefulWidget {

  final AiGameCellModel gameModel;
  final String roomNo;
  final String anchorId;
  ChatroomGameSubPage({Key key, this.gameModel, this.roomNo, this.anchorId}): super(key: key);

  @override
  ChatroomGameSubPageState createState() => ChatroomGameSubPageState();
}

class ChatroomGameSubPageState extends State<ChatroomGameSubPage> with AutomaticKeepAliveClientMixin{

  String gameUrl;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    print('游戏页销毁--');
    destroyRequest();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Show(
          isShow: !isStrNullOrEmpty(gameUrl) ,
          child: NewUserCoursePage(
            isShowGameBgColor: true,
            isJointLang: false,
            url: gameUrl,
            isSystemRepair: true,
          ),
        )
    );
  }

  void clear(){
    gameUrl = '';
    cancelToken?.cancel(stopLineupRequestError);
    if(mounted)setState(() {});
  }

  void loadData() async{
    cancelRequest();
    AiGameCellModel cellModel = widget.gameModel;
    if(isStrNullOrEmpty(cellModel?.supplierId) || isStrNullOrEmpty(cellModel?.gameKey)) return;
//    ModuleStatistics.ins.statisticsEvent(StatisticsType.StatisticsDetailChatRoomGame);
    String url = cellModel?.url;
    final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
    loading.show(context);
    var result = await GameURlReqProtocol(supplierId: cellModel.supplierId, gameKey: cellModel.gameKey).request(cancelToken: cancelToken);
    loading.dismiss();
    await sleep(500);
    url = result.url;
    if(result.isError){
      showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
      return;
    }
    config.userInfo.isClickGameFloat = true;
    // 统计用
    gameUrl = '$url&roomNo=${widget.roomNo}&anchorId=${widget.anchorId}';
    print('游戏--name:${cellModel.gameName} gameUrl--：$gameUrl');
    if(mounted)setState(() {});
  }

  CancelToken cancelToken = CancelToken();
  String stopLineupRequestError = 'game stop before request';

  cancelRequest(){
    cancelToken?.cancel(stopLineupRequestError);
    cancelToken = CancelToken();
  }

  destroyRequest(){
    cancelToken?.cancel(stopLineupRequestError);
    cancelToken = null;
  }

  @override
  bool get wantKeepAlive => true;
}
