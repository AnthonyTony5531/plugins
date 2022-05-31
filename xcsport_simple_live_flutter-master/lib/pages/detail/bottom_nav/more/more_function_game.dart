import 'package:fast_ai/api/protocols/aigames/ai_gamelist_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/detail/bottom_nav/more/more_function.dart';
import 'package:fast_ai/pages/games/ai_game_cell_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef GameClick<FunctionType, AiGameCellModel> = void Function(FunctionType type, AiGameCellModel cellModel);
typedef GameValueChanged<T, S, L, Z> = void Function(T type, S games, L index, Z offset);


class MoreFunctionGame extends StatefulWidget {
  final GameClick<FunctionType, AiGameCellModel> onClickItem;
  final GameValueChanged<FunctionType, List<AiGameCellModel>, int, Offset> onGameValueChanged;
  final double itemWidth;
  final double itemPadding;
  MoreFunctionGame({
    Key key,
    this.onClickItem,
    this.itemWidth,
    this.itemPadding,
    this.onGameValueChanged,
  }) : super(key: key);

  @override
  _MoreFunctionGameState createState() => _MoreFunctionGameState();
}

class _MoreFunctionGameState extends State<MoreFunctionGame> {
  var baseLang = config.langMap['baseLang'];
  List<AiGameCellModel> models = [];
  ScrollController scrollController = ScrollController();
  GlobalKey _gameKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final hasData = models.length != 0;
    return hasData
        ? Container(
            key: _gameKey,
            height: 101.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                splitLine(),
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      cacheExtent: 54.0,
                      itemCount: models.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        if (index > models.length) return Container();
                        AiGameCellModel cellModel = models[index];
                        return menuItem(cellModel, index);
                      }),
                ),
              ],
            ))
        : SizedBox.shrink();
  }

  Widget menuItem(AiGameCellModel cellModel, int index) {
    String errorUrl = 'assets/images/detail/more/img_detail_game_empty.png';
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.only(left: widget.itemPadding, right: widget.itemPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 42.0,
                  width: 42.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.0),
//                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Container(
                    child: AiImage.fromUrlWithFadeInImage(cellModel.icon, errorUrl, BoxFit.cover),
                  )),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                width: widget.itemWidth,
                alignment: Alignment.center,
                child: Text(
                  cellModel?.gameName ?? '',
                  style: titleStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (widget?.onClickItem != null) {
            if (Hooks.ins.isBlocked(HookName.EnterCq9Game, {})) return;
            widget?.onClickItem(FunctionType.functionGame, cellModel);
          }
          if(widget?.onGameValueChanged != null){
            if (Hooks.ins.isBlocked(HookName.EnterCq9Game, {})) return;
              RenderBox renderBox = _gameKey?.currentContext?.findRenderObject();
              Offset offset = renderBox?.localToGlobal(Offset.zero);
              Offset gameBtnOffset = offset;
              if(gameBtnOffset != null){
                gameBtnOffset = Offset(offset.dx + 42 * 0.5 + 42 * index, offset.dy + 80.0);
              }
              else {
                gameBtnOffset = Offset(10.0, AiMeasure.screenHeight(context) - 42.0);
              }
              widget.onGameValueChanged(FunctionType.functionGame, models, index, gameBtnOffset);
          }
        });
  }

  Widget splitLine() {
    return Container(
      margin: EdgeInsets.only(left: 12.0, right: 12.0),
      height: 1.0,
      color: Colors.white.withOpacity(0.15),
    );
  }

  TextStyle titleStyle() {
    return AiTextStyle(
      color: Color(0xFF999999),
      fontSize: config.skin.fontSize.h6,
      fontWeight: config.skin.fontWeight.regular,
      fontFamily: config.skin.fontFimaly.pingFang,
    );
  }

  bool isInited = false;

  Future<void> loadData() async {
    var req = await AiGameListNewReqProtocol(row: 100).request();
    if (req.isSuccess) {
      models = req.models;
      if (mounted) {
        setState(() {});
      }
    } else {
      throw req.msg;
    }
  }
}
