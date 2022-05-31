import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/util/sizebox_util.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'anchor_order_share_pay_prompt_page_view_model.dart';
import 'anchor_order_share_pay_prompt_page_style.dart';

///
/// 主播爆料分析支付确认
///
class AnchorOrderSharePayPromptPage extends StatelessView<
    AnchorOrderSharePayPromptPageStyle,
    AnchorOrderSharePayPromptPageViewModel> {
  final AnchorOrderSharePayPromptPageViewModel model;

  const AnchorOrderSharePayPromptPage({Key key, @required this.model})
      : super(key: key, model: model);

  @override
  Widget render(
      BuildContext context, AnchorOrderSharePayPromptPageViewModel viewModel) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
          margin: EdgeInsets.only(left: 62, top: 0, right: 62, bottom: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AiJson(config.baseLang)
                    .getString('share_order.reward_prompt.title'),
                style: style.title,
              ),
              sh(12),
              Text(
                AiJson(config.baseLang)
                    .getString('share_order.propmt'),
                style: style.message,
              ),
              sh(12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.currency,
                    style: style.message,
                  ),
                  sw(5),
                  Text(
                    model.money,
                    style: style.money,
                  ),
                ],
              ),
              sh(15),
              Text(
                AiJson(config.baseLang)
                    .getString('share_order.reward_prompt.message'),
                style: style.message,
              ),
              sh(19),
              GestureDetector(
                onTap: () {
                  ccRoute.pop(data: true);
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFF5078FF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                      child: Text(
                    AiJson(config.baseLang)
                        .getString('share_order.reward_prompt.ok'),
                    style: style.message,
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  ccRoute.pop();
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  decoration: BoxDecoration(
                    color: ColorsWhite,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                      child: Text(
                    AiJson(config.baseLang)
                        .getString('share_order.reward_prompt.cancel'),
                    style: style.message,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
