
import 'package:fast_ai/config/config.dart';
import 'package:flutter/material.dart';




//主题1------黄色-------------------------------------------------------------------------------

var sysColors = {
  //主题色--黄色(关注色)
  "Attention_Color1"  : config.customStyle.themeColor, //主题颜色:黄色：警示颜色，提醒等；黄色背景：按钮背景
  "Attention_Color2"  : Color(0xFFFF4000),  //红色字体：高亮颜色：滚球比分，场次提醒，注单赢钱等，红色背景：消息气泡等
  "Attention_Color3"  : Color(0xFF11D664),  //绿色字体：输钱，完成等按钮字体颜色；选中的背景颜色

  //黑色字体的颜色
  "FontColor_Dark" : Color(0xFF000000),//黑色：着重色，球队，nav选中，比分，黄色背景的BTN文字等  100%黑色
  "FontColor_White" : Color(0xFFFFFFFF),//白色：着重色，球队，nav选中，比分，黄色背景的BTN文字等  100%白色
  "bgColorDeepDark" : Color(0xFF222222),//深灰：1.5级着重色：tab底色
  "FontColor_Regular" : Color(0xFF666666),//深灰：二级着重色：联赛等   对应60%黑色
  "FontColor_Light" : Color(0xFF999999),//灰：次要色，日期等    对应40%黑色
  "FontColor_Disable" : Color(0xFFCCCCCC),//灰：次要色，日期等    对应40%黑色

  //字体和背景公用的颜色
  "BgColorGloabl"   : Color(0xFFF4F5F8),  //应用的全局背景颜色
  "BgColorLocal"    : Color(0xFFFFFFFF),  //白色：深色背景的文字
  "IconColor"  : Color(0xFFCCCCCC),  //字体浅灰：禁用颜色；icon的颜色
  "DeviderColor" : Color(0xFFEFEFEF),  //分隔线条着色
  
  //输钱
  "LoseColor" : Color(0xFF11D664),//绿色字体：输钱，完成等按钮字体颜色；选中的背景颜色

  /* 关注 */
  /// 10%黑色
  "FontColor_Dark10" : Color(0x20000000),
  /// 30%黑色
  "FontColor_Dark30" : Color(0x4C000000),
  /// 40%黑色
  "FontColor_Dark40" : Color(0x66000000),
  /// 50%黑色
  "FontColor_Dark50" : Color(0x7F000000),
  /// 60%黑色
  "FontColor_Dark60" : Color(0x99000000),
  /// 70%黑色
  "FontColor_Dark70" : Color(0xB2000000),
  /// 80%黑色
  "FontColor_Dark80" : Color(0xCC000000),
  /// 90%黑色
  "FontColor_Dark90" : Color(0xE6000000),

  /// 40%白色
  "FontColor_White40" : Color(0x66FFFFFF),
  /// 50%白色
  "FontColor_White50" : Color(0x7FFFFFFF),
  /// 60%白色
  "FontColor_White60" : Color(0x99FFFFFF),
  /// 70%白色
  "FontColor_White70" : Color(0xB2FFFFFF),

  /// 灰: 对应100% 19263B
  "main_Color" : Color(0xFF19263B),
  /// 灰: 对应60% 19263B
  "main_Color60" : Color(0x9919263B),
  /// 灰: 对应40% 19263B
  "main_Color40" : Color(0x6619263B),

  "bg_Color" : Color(0xFFF5F5F5),

  "rank_bg_red_color" : Color(0xFFFBF1F1),
  "rank_bg_blue_color" : Color(0xFFE4E8F6),
};

//------公共部分属性-------------------------------------------------------------------------------

var sysFontFimaly = {
  //"PingFang" : "PingFang",//除下2项其他的所有字体样式
  "Money" : "Money",//金额专用字体
  "LiGothicMed" : "Ratio",//赔率；输赢金额专用
  "DINCondensed" : "Score",//比分专用
  "HYYakuHei" : "HYYakuHei",
  "VisbyCF" : "VisbyCF",
  "YouSheBiaoTiHei" : "YouSheBiaoTiHei",
  // 添加字体请通知自行修改sdk_package_utls.sh脚本prepareSDKAsset方法，不然导致安卓SDK显示异常(图片和文案)等不可预测bug，iOS SDK仅显示默认字体！！！！！！！！！！！！
};

var sysFontSize = {
  "H1" : 24.0,//完场比分，DINCondensed专用，其他地方几乎用不到
  "H2" : 20.0,//title标题，消息，新闻等*******极限最大字体*******
  "H2_1" : 18.0,//title标题，消息，新闻等*******极限最大字体*******
  "H3" : 16.0,//Nav1;subnav选中状态
  "H4" : 14.0,//H1:球队，投注项，subnav非选中状态，联赛列表联赛字体，日期，其他
  "H5" : 12.0,//正常字体大小
  "H6" : 10.0,//小字:星期，场次等，*******极限最小字体*******
  "H7" : 9.0,//小字:星期，场次等，*******极限最小字体*******
  "H8" : 8.0,/// 更多直播场次-主播名 
};

var sysFontWeight = {
  "bold" : FontWeight.w900,//着重显示粗体：球队，选中状态，投注项
  "Medium" : FontWeight.w600,//着重显示粗体：球队，选中状态，投注项
  "Regular" : FontWeight.w400,//正常粗细
  "Light" : FontWeight.w100,//极细体：标题等
};

var sysRadius = {
  "R10" : 10.0,//所有有圆角矩形的规格：列表的场次的底
  "R100" : 375.0,//所有圆形的规格，用户数字的底：ex:比赛场次，赔率选中，消息通知等样式;球队、联赛的logo设置圆形
};

var sysDisdance = {
  //间隙与间距
  "L10" : 10.0,//全局的间隙，等同于padding:.1rem;
  "L3" : 3.0,//一般容器与容器之间的间隙，等同于padding-left:.03rem;用于文字与文字等之间的间隙，视情况而定
  "L5" : 5.0,//一般容器与容器之间的间隙，等同于padding-left:.05rem;用于文字和icon之间的间隙，视情况而定

  //高度-lineheight & height
  "L18" : 18.0,//150%的行间距；联赛logo大小
  "L20" : 20.0,//个人中心及一般的icon的大小
  "L24" : 24.0,//200%的行间距；球队logo大小
  "L30" : 30.0,//等同于padding-left:.30rem;提示等；日期等；完场的球队logo；
  "L36" : 36.0,//等同于padding-left:.36rem;可点击范围的最小高度和宽度,  *******如果有点击事件动作，最安全的距离*******
  "L40" : 40.0,//等同于padding-left:.40rem;subnav,subtitle二级标题的高度
  "L52" : 52.0,//等同于padding-left:.52rem;底部弹出的按钮高度；nav,title的一级高度；通栏按钮的高度
  "L60" : 60.0,//等同于padding-left:.6rem;超大按钮的高度等，视情况而定
};

