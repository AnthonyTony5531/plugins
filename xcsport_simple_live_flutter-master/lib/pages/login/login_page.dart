import 'dart:async';

import 'package:common_component/component/route/route.dart';
import 'package:common_component/package/common_component_package.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/migrate_plugins/flushbar/flushbar.dart';
import 'package:fast_ai/models/player_account_model.dart';
import 'package:fast_ai/module/common/matedata/live188_route_table_name.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/widget/loading_dialog.dart';
import 'package:fast_ai/module/wallet/config/flutter_wallet_centerconfig.dart';
import 'package:fast_ai/module/wallet/service/flutter_wallet_centerservice.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_float/activity_draw_float_widget.dart';
import 'package:fast_ai/pages/ai_module/ai_apge_sport.dart';
import 'package:fast_ai/router.dart';
//import 'package:fast_ai/sdk_api/vs_adapter.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_cache.dart';
import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/utils/keyboard_utils.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_player_view.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _pwd;
  FocusNode _passFocusNode = FocusNode();
  TextEditingController _passController = TextEditingController();

  Map get baseLang => config.langMap['baseLang'];

  @override
  void initState() {
    Net.request.loginShow = true;

    _name = ccCache.getString('loginName', '');

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

//    FloatShopCarHelper.hideShoppingCar();
    _passFocusNode.addListener(clearPassword);
    FloatActivityDrawCarHelper.hideActivityDraw();
    super.initState();
  }

  // 聚焦清除密码
  void clearPassword() {
    if (_passFocusNode.hasFocus) {
      _passController.clear();
    }
  }

  @override
  void dispose() {
//    simplePlayerController?.dispose();
    Net.request.loginShow = false;
    _passFocusNode.removeListener(clearPassword);
    super.dispose();
  }

  bool loginEnable = true;
  LoadingDialog loadingDialog;

  void _formSubmitted() async {
    if (!loginEnable) return;
    loginEnable = false;
    hideKeyBoard(context);
    _doTask();
  }

  void _doTask() async {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      if (null != loadingDialog && loadingDialog.isShowing) {
        loginEnable = true;
        return;
      }
      if (_name.trim().isEmpty || _pwd.trim().isEmpty) {
        Flushbar(
          title: "${config.langMap['baseLang']['message']['title']}",
          message: "${config.langMap['baseLang']['login']['emptyWarningMessage']}",
          duration: Duration(seconds: 2),
        ).show(context);
        loginEnable = true;
        return;
      }
      loadingDialog = LoadingDialog.create(
        "${config.langMap['baseLang']['login']['loading']}",
        onForceClose: () {
          Net.close();
        },
      );
      loadingDialog.show(context);
      Net.login(_name, _pwd).then((m) async {
        if (mounted) {
          if (m.code == 200) {
            if (config.isGbet) {
              cmPackageConfig.live188tokenConfig.saveToken(m.data);
            }
            await SysService.ins.getMerchantAppConfig();
            if(config.isGbet) {
              await Future.wait([walletCenterService.init(),walletCenterConfig.init()]);
            }
            //查询是否需加强制修改密码
            bool forceModifyPwd = await queryForceModifyPwd();
            loadingDialog.dismiss();
            //需要弹出修改页面
            if (forceModifyPwd) {
              AiCache.get().setBool(AiCache.force_modify_pwd, true);

              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  builder: (BuildContext _context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                      height: MediaQuery.of(context).size.height - 100,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 44,
                            alignment: Alignment.center,
                            child: Text(
                              getMinePwdBaseLang(key: 'modifyPassword'), //'修改密码',
                              style: AiTextStyle(
                                  fontFamily: config.skin.fontFimaly.pingFang,
                                  fontWeight: config.skin.fontWeight.regular,
                                  fontSize: config.skin.fontSize.h4,
                                  color: config.skin.colors.fontColorDark),
                            ),
                          ),
//                          ModifyPasswordView(
//                            showOldPassword: false,
//                            loginName: _name,
//                            oldPassword: '',
//                            modifyResultCallback: (bool modifyResult, String msg) async {
//                              if (modifyResult) {
//                                AiCache.get().setBool(AiCache.force_modify_pwd, false);
//                                showToas(
//                                  getMinePwdBaseLang(key: 'modifySuccess'),
//                                );
//                                Navigator.pop(context);
//                                await sleep(200);
//                                await SysService.ins.init();
//                                jumpPage();
//                              } else {
//                                showToas(string(
//                                  msg,
//                                  defaultVal: getMinePwdBaseLang(key: 'modifyFail'),
//                                ));
//                              }
//                            },
//                          ),
                        ],
                      ),
                    );
                  });
            } else {
              await SysService.ins.init();
              loadingDialog.dismiss();
              jumpPage();
            }
          } else {
            loginEnable = true;
            loadingDialog.dismiss();
            Flushbar(
              title: '${config.langMap['baseLang']['login']['loginFailed']}',
              message: errorMsgFormat(m.code, msg: m.msg),
              duration: Duration(seconds: 2),
            ).show(context);
          }
        }
      }).catchError(() {
        loadingDialog.dismiss();
        Net.close();
      });
    } else {
      loginEnable = true;
    }
  }

  void jumpPage() {
//    if (config.isGbet) {
//      ccRoute.push(routeName: Live188RouteTableName.HomePage, pushMethod: PushMethod.PushReplacement);
//    } else if (config.isVs) {
//      config.isVMSport = true;
//      VSAdapter.showVSPage(context: context, fromLogin: true);
//    } else {
//      if (AiCache.get().getString(AiCache.app_version) == config.appInfo.appVersion || config.isInternational) {
//        if (config.isTabSDK) {
//          AiRouter.pushReplacement(
////              MaterialPageRoute(builder: (context) => SportAiPage(), settings: RouteSettings(name: 'sportAiPage'), fullscreenDialog: true));
//        } else {
//          AiRouter.pushReplacement(
//              MaterialPageRoute(builder: (context) => AiPage(), settings: RouteSettings(name: TabSdkPage.main), fullscreenDialog: true));
//        }
//      } else {
//        AiRouter.pushReplacementNamed("guidePage");
//      }
//    }
    AiRouter.pushReplacement(MaterialPageRoute(
        builder: (context) => SportAiPage(),
        settings: RouteSettings(name: 'sportAiPage'),
        fullscreenDialog: true));
  }

  /// 查询是否需加强制修改密码
  Future<bool> queryForceModifyPwd() async {
    PlayerAccountModel playAccount = await Net.playAccount();
    return Future.value(playAccount?.data?.forceModifyPwd ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.black),
      child: Scaffold(
          body: WillPopScope(
        // ignore: missing_return
        onWillPop: () async {
          config.platformChannel.invokeMethod("exit");
          return false;
        },
        child: GestureDetector(
            onTap: () {
              hideKeyBoard(context);
            },
            child: Stack(children: <Widget>[
              Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  child: AiVideoPlayerView(
                    type: AiVideoType.video,
                    url: 'asset:///assets/files/media/login.mp4',
                    fijkBuilder: AiFijkPlayerBuilder(
                      isAutoPlay: true,
                      loopCount: 0,
                      showController: false,
                      fit: AiVideoFit.fill,
                      videoBgCol: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                width: MediaQuery.of(context).size.width,
                child: AiImage.asset(Api.packageType ? "assets/images/logo-jz.png" : "assets/images/logo.png", height: 50),
              ),
              Container(
                  child: ListView(
                children: <Widget>[InterValHelper.h(140), _body()],
              ))
            ])),
      )),
    );
  }

  Widget _body() {
    final ThemeData theme = Theme.of(context);

    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(12.0),
          height: 400.0,
          child: Column(
            children: <Widget>[
              TextFormField(
                style: AiTextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.2)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: '${config.langMap['baseLang']['login']['verifiedText']}',
                  labelStyle: theme.textTheme.bodyText2.copyWith(color: Color(0xff888888)),
                ),
                initialValue: _name,
                onChanged: (val) {
                  if (mounted)
                    setState(() {
                      _name = val;
                    });
                },
              ),
              TextFormField(
                style: AiTextStyle(color: Colors.white),
                // obscureText: true,
                controller: _passController,
                focusNode: _passFocusNode,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0.2)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: '${config.langMap['baseLang']['login']['enterPassword']}',
                  labelStyle: theme.textTheme.bodyText2.copyWith(color: Color(0xff888888)),
                ),
                onSaved: (val) {
                  _pwd = val;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isNullOrEmpty(_name) ? theme.colorScheme.secondary : theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20.0)),
                child: FlatButton(
                  child: Text('${config.langMap['baseLang']['login']['loginText']}',
                      style: isNullOrEmpty(_name) ? theme.textTheme.subtitle1.copyWith(color: Color(0xFF594800)) : theme.textTheme.subtitle1),
                  onPressed: _formSubmitted,
                ),
              )
            ],
          ),
        ));
  }

  ///
  String getMinePwdBaseLang({String key = ''}) {
    try {
      return baseLang['mine']['password']['$key'];
    } catch (_) {
      return '';
    }
  }
}
