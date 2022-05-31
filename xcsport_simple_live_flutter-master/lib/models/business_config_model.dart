import 'package:fast_ai/utils/ai_json.dart';

class BusinessConfigModel{

  String lightLogo;
  String darkLogo;
  String appDownload;
  String androidDownloadUrl;
  String iosDownloadUrl;
  String selfSwitch;
  String title;
  String deposit;
  String withdraw;
  String customerService;
  String transfer;
  String activity;
  String register;
  String login;
  String logoIcon;
  String navStatus;
  String startTime;
  String endTime;
  String status;
  LogoModel betFont;
  LogoModel loadingImage;
  LogoModel topLogo;
  List<MenuItemModel> menu;


  Map<String,dynamic> rawOption;
  BusinessConfigModel fromBusinessConfigReqProtocol(Map<String, dynamic>option){
    this.rawOption = option;

    lightLogo = AiJson(option).getString('lightLogo');
    darkLogo = AiJson(option).getString('darkLogo');
    appDownload = AiJson(option).getString('appDownload');
    androidDownloadUrl = AiJson(option).getString('androidDownloadUrl');
    iosDownloadUrl = AiJson(option).getString('iosDownloadUrl');
    selfSwitch = AiJson(option).getString('selfSwitch');
    title = AiJson(option).getString('title');
    deposit = AiJson(option).getString('deposit');
    withdraw = AiJson(option).getString('withdraw');
    customerService = AiJson(option).getString('customerService');
    transfer = AiJson(option).getString('transfer');
    activity = AiJson(option).getString('activity');
    register = AiJson(option).getString('register');
    login = AiJson(option).getString('login');
    logoIcon = AiJson(option).getString('logoIcon');
    navStatus = AiJson(option).getString('navStatus');
    startTime = AiJson(option).getTimestampStr('startTime');
    endTime = AiJson(option).getTimestampStr('endTime');
    status = AiJson(option).getString('status');
    List menus = AiJson(option).getArray('menu');
    menu = List();
    for(int index = 0; index < menus.length; index ++){
      var item = menus[index];
      menu.add(MenuItemModel().fromMap(item));
    }

    betFont = LogoModel().fromMap(AiJson(option).getMap('betFont'));
    loadingImage = LogoModel().fromMap(AiJson(option).getMap('loadingImage'));
    topLogo = LogoModel().fromMap(AiJson(option).getMap('topLogo'));

    return this;
  }
}

class MenuItemModel {
    String name;
    String icon;
    String url;
    MenuItemModel fromMap(Map<String, dynamic>option){
      name = AiJson(option).getString('name');
      icon = AiJson(option).getString('icon');
      url = AiJson(option).getString('url');
      return this;
    }
}

class LogoModel{

  String ai;
  String bi;

  LogoModel fromMap(Map map){
    ai = AiJson(map).getString('ai');
    bi = AiJson(map).getString('bi');
    return this;
  }

  @override
  String toString() {
    return 'ai=$ai, bi=$bi';
  }

}