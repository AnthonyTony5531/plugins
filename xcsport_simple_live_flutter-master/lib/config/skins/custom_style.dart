import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomStyle {
  CustomStyle();

  Color themeColor = Color(0xFF5078FF); //主⾊纯⾊
  Color themeColorDisable = Color(0xFFfef7d5); //主⾊纯⾊对应的禁用颜色
  Color themeAssistColor = Color(0xFF5078FF); //辅助⾊
  List<Color> themeLinearColor = [Color(0xFF70ADFE), Color(0xFF4B72FF)]; //主⾊渐变
  Color themeIncludeFontColor = Color(0xFFFFFFFF); //主⾊下包裹的的文字颜色
  //主页面头部 tabbar背景色和文字颜色
  List<Color> tabBarBgColor = [Color(0xFF4B72FF), Color(0xFF4B72FF)];
  Color tabBarTextColor = Color(0xFF000001);
  //bottomBar 选中字体颜色
  Color bottomBarSelectTextColor = Color(0xFFCCCCCC);
  //精选背景色
  Color refinedBgColor = Color(0xFF005866);



  // Color themeColor = Color(0xFFFF9E48); //主⾊纯⾊
  // Color themeColorDisable = Color(0xFFFF9E48).withOpacity(0.4); //主⾊纯⾊对应的禁用颜色
  // Color themeAssistColor = Color(0xFFFDC139); //辅助⾊
  // Color themeIncludeFontColor = Color(0xFFFFFFFF); //主⾊下包裹的的文字颜色
  // //主⾊渐变
  // List<Color> themeLinearColor = [Color(0xFFFF8446), Color(0xFFFFB749)];
  // //主页面头部 tabbar背景色和文字颜色
  // List<Color> tabBarBgColor = [Color(0xFFFF8446), Color(0xFFFFB749)];
  // Color tabBarTextColor = Color(0xFFFFFFFF);
  // //bottomBar 选中字体颜色
  // Color bottomBarSelectTextColor = Color(0xFFFF9247);

  //传入的图片格式
  Map<String, String> img = {
    //我的页面icon（svg格式）
    'mine_setting_icon':
        'assets/images/member/icon_mine_setting_white.svg', //设置
    'mine_refresh_icon':
        'assets/images/member/drawer/icon_personal_refresh_normal.svg', //刷新余额
    'mine_eye_can_icon':
        'assets/images/member/drawer/icon_personal_eye_can.svg', //眼睛 - 可见
    'mine_eye_no_icon':
        'assets/images/member/drawer/icon_personal_eye_no.svg', //眼睛 - 不可见
    'mine_bet_icon':
        'assets/images/member/drawer/icon_personal_betlist_normal.svg', //注单
    'cloud_customer_service_icon':'assets/images/member/drawer/icon_personal_cloud_normal.svg', // 云客服
    'mine_wallet_icon':
        'assets/images/member/drawer/icon_personal_wallet_normal.svg', //流水
    'mine_message_icon':
        'assets/images/member/drawer/icon_personal_message_normal.svg', //消息
    'mine_attention_icon':
        'assets/images/member/drawer/icon_personal_fellow_normal.svg', //关注
    'mine_collect_icon':
        'assets/images/vlog/icon_personal_star_normal.svg', //收藏
    'mine_tutorials_icon':
        'assets/images/member/personal/icon_personal_leader_normal.svg', //新手教程
    'mine_betset_icon':
        'assets/images/mine/icon_personal_betsetting_normal.svg', //投注偏好

     //tabbar上的选中live图标
    'tabbar_select_live_gif': 'assets/images/match/match_live.gif',

    //列表比赛盘口滑动下标
    'match_indicator_icon':
        'assets/images/matchlist/icon_indicator_fb_selected.png',

    //底部菜单 全部
    'menu_all_icon': 'assets/images/sports_type/icon_item_all.gif',

    //底部菜单 top
    'menu_top_icon':
        'assets/images/home_icon/icon_home_back_top.svg', //首页返回向上箭头

    //底部菜单 - 体育
    'menu_sport_normal': 'assets/images/home_icon/icon_home_sport_normal.svg',
    'menu_sport_normal_white':
        'assets/images/home_icon/icon_home_sport_white.svg',

    //底部菜单 - 比赛
    'menu_match_selected':
        'assets/images/home_icon/icon_home_match_selected.gif',
    'menu_match_unselected':
        'assets/images/home_icon/icon_home_match_normal.svg',
    'menu_match_unselected_white':
        'assets/images/home_icon/icon_home_match_white.svg',

    //底部菜单 - 发现
    'menu_found_selected':
        'assets/images/home_icon/icon_home_find_selected.gif',
    'menu_found_selected_white':
        'assets/images/home_icon/icon_home_find_white.gif',
    'menu_found_unselected':
        'assets/images/home_icon/icon_home_find_normal.svg',
    'menu_found_unselected_white':
        'assets/images/home_icon/icon_home_find_white.svg',
    'menu_found_unselected_pure':'assets/images/home_icon/icon_home_find_pure.svg',

    //底部菜单 - 投注单
    'menu_betlist_selected':
        'assets/images/home_icon/icon_home_betlist_selected.gif',
    'menu_betlist_unselected':
        'assets/images/home_icon/icon_home_betlist_normal.svg',
    'menu_betlist_unselected_white':
        'assets/images/home_icon/icon_home_betlist_white.svg',

    //底部菜单 - 我的
    'menu_mine_selected': 'assets/images/home_icon/icon_home_mine_selected.gif',
    'menu_mine_unselected': 'assets/images/home_icon/icon_home_mine_normal.svg',
    'menu_mine_unselected_white':
        'assets/images/home_icon/icon_home_mine_white.svg',
  };

  CustomStyle.parse(Map<String, dynamic> params) {
    if (params == null || params == {}) return;
    try {
      var aiJson = AiJson(params);

      dynamic themeColorFlag = aiJson.getObject("themeColor");
      if (!isStrNullOrEmpty(themeColorFlag) && themeColorFlag is Color) {
        themeColor = themeColorFlag;
      }

      dynamic themeAssistColorFlag = aiJson.getObject("themeAssistColor");
      if (!isStrNullOrEmpty(themeAssistColorFlag) &&
          themeAssistColorFlag is Color) {
        themeAssistColor = themeAssistColorFlag;
      }

      dynamic themeColorDisableFlag = aiJson.getObject("themeColorDisable");
      if (!isStrNullOrEmpty(themeColorDisableFlag) &&
          themeColorDisableFlag is Color) {
        themeColorDisable = themeColorDisableFlag;
      }

      dynamic themeLinearColorFlag = aiJson.getObject("themeLinearColor");
      if (!isStrNullOrEmpty(themeLinearColorFlag) &&
          themeLinearColorFlag is List<Color>) {
        themeLinearColor = themeLinearColorFlag;
        tabBarBgColor = themeLinearColor;
      }

      dynamic themeIncludeFontColorFlag =
          aiJson.getObject("themeIncludeFontColor");
      if (!isStrNullOrEmpty(themeIncludeFontColorFlag) &&
          themeIncludeFontColorFlag is Color) {
        themeIncludeFontColor = themeIncludeFontColorFlag;
        tabBarTextColor = themeIncludeFontColor;
      }
      dynamic bottomBarSelectTextColorFlag =
          aiJson.getObject("bottomBarSelectTextColor");
      if (!isStrNullOrEmpty(bottomBarSelectTextColorFlag) &&
          bottomBarSelectTextColorFlag is Color) {
        bottomBarSelectTextColor = bottomBarSelectTextColorFlag;
      }

      dynamic imgFlag = aiJson.getObject("img");
      if (!isStrNullOrEmpty(imgFlag) && imgFlag is Map) {
        imgFlag.keys.forEach((key) {
          if (!isStrNullOrEmpty(imgFlag[key])) {
            img[key + '_input'] = imgFlag[key];
          }
        });
      }
    } catch (e) {}
  }

  Widget loadCustomImg(String key, {double width, double height}) {
    Widget widget = Container();
    bool usePackage = true;
    String url = '';
    Map<String, String> img = this.img;
    url = img[key];

    if (!isEmpty(img[key + '_input'])) {
      url = img[key + '_input'];
      usePackage = false;
    }

    if (!isEmpty(url)) {
      if (url.endsWith('.svg')) {
        widget = AiSvgPicture.asset(
          url,
          width: width,
          usePackage: usePackage,
          height: height,
        );
      } else {
        widget = AiImage.asset(url,
            usePackage: usePackage, width: width, height: height);
      }
    }
    return widget;
  }

  Map<String, dynamic> getImgUrl(String key) {
    Map<String, dynamic> res = {'usePackage': true, 'url': ''};

    Map<String, String> img = this.img;
    String url = img[key];
    bool usePackage = true;

    if (!isEmpty(img[key + '_input'])) {
      url = img[key + '_input'];
      usePackage = false;
    }
    res['url'] = url;
    res['usePackage'] = usePackage;
    return res;
  }
}
