import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_style.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_my_contribution/anchor_my_contribution_viewmodel.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/shape_button.dart';
import 'package:flutter/material.dart';

class AnchorMyContributionStatelessView extends StatelessView<
    AnchorMyContributionStyle, AnchorMyContributionViewModel> {
  final AnchorMyContributionViewModel model;
  final VoidCallback onShowGift;

  const AnchorMyContributionStatelessView(
      {Key key, this.model, this.onShowGift})
      : super(key: key, model: model);

  @override
  Widget render(BuildContext context, AnchorMyContributionViewModel viewModel) {
    return Container(
      height: 54.0,
      color: Colors.white,
      child: Column(
        children: [
          Divider(
            color: Color(0xFFF5F5F5),
            height: 1.0,
          ),
          Container(
            height: 53.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _configTotalMessageWidget()),
                _configSendWidget(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _configTotalMessageWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _configRankWidget(),
          AiImage.userLogo(model.headImg, size: 28.0),
          Expanded(
            child: _configMessageWidget(),
          ),
        ],
      ),
    );
  }

  Widget _configRankWidget() {
    return Container(
      width: 44.0,
      alignment: Alignment.center,
      child: Text(
        '${model.rank <= 0 ? '50+' : model.rank}',
        style: style.numStyle,
      ),
    );
  }

  Widget _configMessageWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: model.rank > 0
          ? Text(
              model.me,
              style: style.nameStyle,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.me,
                  style: style.nameStyle,
                ),
                Container(
                    margin: EdgeInsets.only(top: 4.0),
                    child: Text(
                      model.rank <= 0
                          ? model.isRank == true
                              ? model.askForLottery
                              : model.askForGift
                          : '',
                      maxLines: 3,
                      style: style.desStyle,
                    ))
              ],
            ),
    );
  }

  Widget _configSendWidget(BuildContext context) {
    var rightWidget = model.isRank == true
        ? SizedBox(
            width: 54.0,
          )
        : GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: shapeButton(
                width: 38.0,
                height: 24.0,
                margin: EdgeInsets.only(right: 16.0),
                alignment: Alignment.center,
                child: Text(
                  model.sendGift,
                  textAlign: TextAlign.center,
                  style: style.attentionStyle,
                )),
            onTap: () {
              showGift(context);
            },
          );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Text(
              '${model.contributeValue}',
              style: style.contributionValueStyle,
            ),
          ),
          rightWidget,
        ],
      ),
    );
  }

  void showGift(BuildContext context) {
    if (onShowGift != null) {
      onShowGift();
    }
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
//      Future.delayed(Duration(milliseconds: 2000),(){
//        PopupShareService.ins.pause('_openGiftPan');
//        showModalBottomSheetRoute(
//            context,
//            child: GiftPanPage(
//              anchorId: widget.anchorId ?? '',
//              roomNo: widget.roomNo ?? '',
//              gidm: widget.gidm ?? '',
//            ),
//            height: 450.0,
//            isClip: false,
//            barrierColor: Colors.transparent
//        ).then((v){
//          PopupShareService.ins.resume('_openGiftPan');
//        });
//      });
  }
}
