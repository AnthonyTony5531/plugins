import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/system_repair/sdk_input_widget.dart';
import 'package:fast_ai/sdk_api/sdk_api.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/widgets/loading_dialog.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fast_ai/api/protocols/system/system_maintain_Info_protocol.dart';

class SystemRepairPage extends StatefulWidget {
  final String servicingTime;/// 当前维护时间
  final String sportPlatform;/// 选择的platform
  final bool allSystemRepair;/// 全系统是否维护
  final SystemMaintainInfo info;/// 系统状态信息
  final bool isServiceRepare;/// 我们自己系统维护
  SystemRepairPage({Key key, this.info,this.servicingTime, this.sportPlatform = '1', this.allSystemRepair = false, this.isServiceRepare = false})
      : super(key: key);

  @override
  _SystemRepairPageState createState() => _SystemRepairPageState();
}

class _SystemRepairPageState extends State<SystemRepairPage> {
  String currentSportPlatform;
  StreamSubscription event;
  bool isSendRequest = false;
  bool isClickRefresh = false;
  Timer intervalTimer;
  String repairing = '';
  String repairingTime = '';
  String refresh = '';
  String systemRepairing = '';
  String repairingus = '';
  String repairingTimeus = '';
  String refreshus = '';
  String systemRepairingus = '';
  bool isShowEnglish = false;

  List<String> get enablePlatformIds {

    List<String> allPlatform = SportPlatform.ins.getPlatformInfos().map((e){
      return e.id;
    }).toList();
    if(widget.info?.platformIds != null){
      allPlatform.removeWhere((element) => widget.info.platformIds.contains(element));
    }

    return allPlatform;
  }

  @override
  void initState() {
    var baseLang = config.langMap['baseLang'];
    repairingus = "System maintenance......";
    repairingTimeus = "Estimated Repair Time";
    refreshus = 'Refresh';
    systemRepairingus = 'Maintenance in progress, please try again later...';
    repairing = baseLang['login']['repairing'];
    repairingTime = baseLang['login']['EstimatedRepairingTime'];
    refresh = baseLang['refresh'];
    systemRepairing = baseLang['utils']['errorMsgFormat']['systemRepairing'];
    // 安装App进入是运维维护默认显示英文
    isShowEnglish = config.userInfo.sdkIsFirstOpen() && widget.isServiceRepare;
    currentSportPlatform = widget.sportPlatform;
    event = Event.eventBus.on<MerchantInfoUpdateEvent>().listen((ev) {
      if (mounted) {
        setState(() {});
      }
    });
    XcSdkApi.showBottomBar();
    // 新体育已添加
    if(!config.isFastAiSdk){
      stopTimer();
      intervalTimer = Timer.periodic(Duration(seconds: 30), (timer) {
        refreshData();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    config.userInfo.showSystemRepairPage = false;
    event?.cancel();
    stopTimer();
    super.dispose();
  }

  void stopTimer(){
    intervalTimer?.cancel();
    intervalTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    String servicingTime = getServicingTime(context);
    Size size = MediaQuery.of(context).size;
    double repairTimeWidth = 225 * 0.8;
    double repairTimeHeight = 237 * 0.8;

    if(config.isFastAiSdk){
      // 403
      if(config.userInfo.show403SystemRepairPage){
        return SdkInputWidget(
          widgetKey: 'SystemLimitPage',
          padding: EdgeInsets.only(bottom: 8.0),
        );
      }
      // 503
      return SdkInputWidget(
        widgetKey: 'MXSystemRepairPage',
        padding: EdgeInsets.only(bottom: 8.0),
      );
    }
    return AnnotatedRegion(
      value: !config.isApp ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          color: config.skin.colors.bgColorGloabl,
          child: Stack(children: <Widget>[
            Container(
              width: size.width,
              height: size.height,
            ),
            (!config.isApp && !config.isTabSDK)
                ? Container(
                    color: Colors.black,
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              await XcSdkApi.loginOut();
                            },
                            child: Container(
                              child: AiSvgPicture.asset('assets/images/sdk/icon_sdk_back_normal.svg',
                                  width: 48, height: 28, useLocalAsset: true),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              isShowEnglish ? repairingus : repairing,
                              style: SDKHeaderStyle().nomralText,
                            ),
                          )
                        ],
                      ),
                    ))
                : SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AiImage.asset('assets/images/default/img_default_503_normal.png',
                    width: repairTimeWidth, height: repairTimeHeight, useLocalAsset: true),
                getTimeWidget(servicingTime),
                Offstage(
                  offstage: !config.userInfo.showSportPlatformSwitch || isShowEnglish,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getChangePlatformWidget(context),
                      refreshTextWidget(),
                    ],
                  )
                ),
                showRefreshBtnWidget()
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget showRefreshBtnWidget(){
    if(isShowEnglish){
      return refreshBtnWidget();
    }
    return Offstage(
        offstage: config.userInfo.showSportPlatformSwitch,
        child: refreshBtnWidget()
    );
  }

  String getServicingTime(BuildContext context) {
    if (widget.servicingTime == null) {
      String time = ModalRoute.of(context).settings.arguments;
      return time;
    }
    return widget.servicingTime;
  }

  Widget getTimeWidget(String time) {
    String platformName = SportPlatform.ins.getPlatformName(currentSportPlatform);
    String showPlatformName = !widget.allSystemRepair && config.userInfo.showSportPlatformSwitch
        ? platformName + ' '
        : '';
    String platformNameText = isShowEnglish ? '' : showPlatformName;
    String repairingText = isShowEnglish ? repairingus : repairing;
    String repairingTimeText = isShowEnglish ? repairingTimeus : repairingTime;
    String systemRepairMsg = '${(widget.isServiceRepare != null && widget.isServiceRepare) ? '' : platformNameText}$repairingText';

    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              systemRepairMsg,
              style: getAiTextStyle(config.skin.colors.fontColorDark70, config.skin.fontSize.h4),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              '$repairingTimeText：$time',
              style: getAiTextStyle(config.skin.colors.fontColorDark70, config.skin.fontSize.h4),
            ),
          )
        ],
      ),
    );
  }

  Widget getMailboxWidget() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              '${config.langMap['baseLang']['login']['sendMailPrefix']}',
              style: getAiTextStyle(config.skin.colors.fontColorDark40, config.skin.fontSize.h5),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${config.langMap['baseLang']['login']['sendMailSuffix']}',
                  style: getAiTextStyle(config.skin.colors.fontColorDark40, config.skin.fontSize.h5),
                ),
                GestureDetector(
                  child: Text(
                    'PM@aisport.com',
                    style: getAiTextStyle(Color(0xFF1B91FF), config.skin.fontSize.h5),
                  ),
                  onTap: () {
                    //TelAndSmsService().sendEmail('PM@aisport.com');
                    Clipboard.setData(ClipboardData(text: 'PM@aisport.com')).then((s) {
                      showToas('${config.langMap['baseLang']['copySuccess']}');
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getChangePlatformWidget(BuildContext context) {
    if (widget.allSystemRepair) {
      return Container(
        height: 0,
      );
    }
    if (!config.userInfo.showSportPlatformSwitch) {
      return Container(
        height: 0,
      );
    }

    return enablePlatformIds.length > 0 ? SingleChildScrollView(
      child: Column(
        children: enablePlatformIds.map((e){
          String platformName = SportPlatform.ins.getPlatformName(e);
          String changeName = '${config.langMap['baseLang']['login']['switchTo']}$platformName';

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 6.0,top: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    child: Container(
//                  width: 140,
                      height: 40,
                      color: config.skin.colors.attentionColor1,
                      alignment: Alignment(0, 0),
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                          // '${(isNullOrEmpty(platformName) || platformName == 'null' || platformName == 'NULL')  ? config.langMap['baseLang']['sportPlatformChange'][currentSportPlatform != '1' ? 'toPlatformOne' : 'toPlatformTwo'] : changeName}',
                          changeName,
                          style: getAiTextStyle(config.skin.colors.fontColorDark, config.skin.fontSize.h3)),
                    ),
                    onTap: () {
                      changedPlatform(context, e);
                    },
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    ) : SizedBox(height: 40,);

    
  }

  Widget refreshBtnWidget(){

    String refreshText = isShowEnglish ? refreshus : refresh;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(left: 6.0,top: 30.0),
        width: 140,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: config.skin.colors.attentionColor1,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(refreshText,style: getAiTextStyle(config.skin.colors.fontColorDark, config.skin.fontSize.h3),),
      ),
      onTap: ()async{
        if(isSendRequest){
          return;
        }
        isClickRefresh = true;
        isSendRequest = true;
        Future.delayed(Duration(milliseconds: 1500),(){
          isSendRequest = false;
        });
        refreshData();
      },
    );
  }

  Widget refreshTextWidget(){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(left: 6.0,top: 30.0),
        width: 180.0,
        height: 40.0,
        alignment: Alignment.center,
        color: Colors.transparent,
//        child: Text(config.langMap['baseLang']['refresh'],style: getAiTextStyle(config.skin.colors.fontColorDark, config.skin.fontSize.h3),),
        child: RichText(
          maxLines: 2,
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: config.langMap['baseLang']['refresh'],
                style: AiTextStyle(
                  color: Color(0xFF1B91FF),
                  fontSize: config.skin.fontSize.h4,
                  fontFamily: config.skin.fontFimaly.visbyCF,
                  fontWeight: config.skin.fontWeight.regular,
                  decoration: TextDecoration.none,
                )
              ),
              TextSpan(
                  text: config.langMap['baseLang']['tryRefresh'],
                  style: AiTextStyle(
                    color: Colors.black,
                    fontSize: config.skin.fontSize.h4,
                    fontFamily: config.skin.fontFimaly.visbyCF,
                    fontWeight: config.skin.fontWeight.regular,
                    decoration: TextDecoration.none,
                  )
              ),
            ]
          ),
        ),
      ),
      onTap: ()async{
        if(isSendRequest){
          return;
        }
        isClickRefresh = true;
        isSendRequest = true;
        Future.delayed(Duration(milliseconds: 1500),(){
          isSendRequest = false;
        });
        refreshData();
      },
    );
  }

  void refreshData() async{
//    String hitText = isShowEnglish ? systemRepairingus : systemRepairing;
//    try{
//      var homeCommonReq = HomeCommonMatchesReqProtocol();
//      var rsp = await homeCommonReq.request();
//      if(rsp != null && (rsp?.isSuccess ?? false)){
//        config.userInfo.showSystemRepairPage = false;
//        stopTimer();
//        if (RepairChangeToTargetPageConfig.ins == null) {
//          RepairChangeToTargetPage().change2Target();
//        } else {
//          RepairChangeToTargetPageConfig.ins.change2Target();
//        }
//      }
//      else{
//        if(isClickRefresh){
//          showToas(hitText);
//        }
//      }
//    }catch(e){
//      if(isClickRefresh){
//        showToas(hitText);
//      }
//    }
//    isClickRefresh = false;
  }

  LoadingDialog loadingDialog;

  /// 切换指定platform
  Future changedPlatform(BuildContext context,String platformId) async {

//    config.userInfo.sportPlatformId = int.tryParse(platformId) ?? SportPlatform.ins.getNextPlatformId(currentSportPlatform);
//    BetConfigModel betModel = BetConfigModel();
//    BetConfigUpdateUtil.convertModel(betModel);
//    bool rst = await BetConfigUpdateUtil.sendBetSettingRequest(betModel);
//    if (rst) {
//      currentSportPlatform = '${config.userInfo.sportPlatformId}';
//
//      if (null != loadingDialog && loadingDialog.isShowing) {
//        return;
//      }
//      loadingDialog = LoadingDialog.create(
//        config.langMap['baseLang']['login']['switching'],
//        onForceClose: () {},
//      );
//      loadingDialog.show(context);
//      await sleep(500);
//
//      Future.delayed(Duration(seconds: 15), () async {
//        //如果还在请求，那么久关闭
//        if (loadingDialog.isShowing) {
//          if (mounted) {
//            loadingDialog.dismiss();
//          }
//        }
//      });
//      var result = await Net.topMenu();
//      loadingDialog.dismiss();
//      if (result?.code == 200) {
//        stopTimer();
//        config.userInfo.showSystemRepairPage = false;
//        if (RepairChangeToTargetPageConfig.ins == null) {
//          RepairChangeToTargetPage().change2Target();
//        } else {
//          RepairChangeToTargetPageConfig.ins.change2Target();
//        }
//      } else {
//        if (mounted) {
//          setState(() {});
//        }
//      }
//    } else {
//      showToas(config.langMap['baseLang']['login']['switchFailed']);
//    }
  }

  TextStyle getAiTextStyle(Color color, double fontSize) {
    return AiTextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: config.skin.fontFimaly.pingFang,
      fontWeight: config.skin.fontWeight.regular,
      decoration: TextDecoration.none,
    );
  }
}

class RepairChangeToTargetPageConfig {
  static RepairChangeToTargetPage ins;
}

class RepairChangeToTargetPage {
//  void change2Target() {
//    if (config.isTabSDK) {
//      AiRouter.pushReplacement(MaterialPageRoute(
//          builder: (context) => SportAiPage(), settings: RouteSettings(name: 'sportAiPage'), fullscreenDialog: true));
//    } else {
//      AiRouter.pushReplacement(MaterialPageRoute(
//          builder: (context) => AiPage(), settings: RouteSettings(name: TabSdkPage.main), fullscreenDialog: true));
//    }
//  }
}

class TelAndSmsService {
  void callPhone(String number) => launch('tel:$number');

  void sendSMS(String number) => launch('sms:$number');

  void sendEmail(String email) => launch('mailto:$email');
}

class SDKHeaderStyle {
  final aiText = AiTextStyle(
    fontFamily: config.skin.fontFimaly.yakuHei,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.regular,
    color: config.customStyle.themeColor,
  );
  final nomralText = AiTextStyle(
    fontFamily: config.skin.fontFimaly.yakuHei,
    fontSize: config.skin.fontSize.h3,
    fontWeight: config.skin.fontWeight.regular,
    color: Color(0xFFFFFFFF),
    decoration: TextDecoration.none,
  );
}

