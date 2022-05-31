import 'package:common_component/component/route/route.dart';
import 'package:common_component/component/route/route_table.dart';
import 'package:common_component/util/ai_measure.dart';
import 'package:fast_ai/module/common/matedata/fastai_route_talbe_name.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_animal/activity_draw_animal_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_page.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_lottery_result/activity_draw_lottery_result_view.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_page.dart';
import 'package:fast_ai/pages/detail/anchor_order_share_pay_prompt/anchor_order_share_pay_prompt_page.dart';
import 'package:fast_ai/pages/detail/anchor_order_share_pay_prompt/anchor_order_share_pay_prompt_page_view_model.dart';
import 'package:fast_ai/pages/detail/data_view/data_view_page.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/login/login_page.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_page.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_rule/anchor_rank_rule_page.dart';
import 'package:fast_ai/pages/rank/anchor_rank/anchor_rank_rule/anchor_rank_rule_page_view_model.dart';


class AiRouteTable extends IRouteTable {
  @override
  Map<String, RouteTableBuilder> get tables => {
        FastAiRouteTableName.LoginPage: (context, params) {
          return LoginPage();
        },
        'Ai_loginPage': (context, params) => LoginPage(),
        'detailPage': (context, params) => DetailPage(),
        'dataViewPage': (context, params) => DataViewPage(),
        // 活动翻牌
        FastAiRouteTableName.ActivityDrawFloat: (context, params) {
          return ActivityDrawFloatStatefulView(
            model: params,
            windowWidth: AiMeasure.screenWidth(context),
            windowHeight: AiMeasure.screenHeight(context),
          );
        },
        FastAiRouteTableName.ActivityAnimal: (context, params) {
          return ActivityDrawAnimalStatefulView(
            model: params,
          );
        },
        FastAiRouteTableName.ActivityDrawView: (context, params) {
          return ActivityDrawStatefulView(
            model: params,
          );
        },
        FastAiRouteTableName.ActivityDrawResult: (context, params) {
          return ActivityDrawResultStatefulView(
            model: params,
          );
        },

        FastAiRouteTableName.AnchorRankPage: (context, params) {
          return AnchorRankPage();
        },

        FastAiRouteTableName.AnchorRankRulePage: (context, params) {
          return AnchorRankRulePage(
              model: AnchorRankRulePageViewModel.create());
        },

        FastAiRouteTableName.AnchorOrderSharePayPromptPage: (context, params) {
          return AnchorOrderSharePayPromptPage(
            model: AnchorOrderSharePayPromptPageViewModel.create(
                currency: params['currency'], money: params['money']),
          );
        },
      };
}
