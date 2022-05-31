
import 'dart:async';
import 'dart:ui';
import 'package:fast_ai/api/protocols/module/module_config_protolcol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/module_config/HotMatchRecommendModel.dart';

///
/// 模块开关逻辑优化
/// 1.当请求模块开关接口出错请求到不到数据时，_moduleSwitch为空时所有模块开关状态返加为true
/// 2.增加_checkModuleConfigLoadStatus用于检测模块开关配置数据是否加载成功，如果未成功则重新
/// 启动加载；如果已成功则关闭定时检测功能
///
class ModuleSwitch{

  ModuleSwitch._();

  static ModuleSwitch _instance;
  static bool _exit = false;
  static ModuleConfigModel _modelConfig;

  static VoidCallback updateCallback;
  static Timer _timer;
  static Timer _checkTimer;
  static Map<String,bool> _moduleSwitch = Map();

  static ModuleSwitch getInstance() {
    if(_instance == null){
      _instance = ModuleSwitch._();
      _getModuleConfig();
      _checkModuleConfigLoadStatus();
    }
    return _instance;
  }

  static const int _MaxFailCount = 3;
  static int _failCount = 0;

  ///获取模块配置
  static void _getModuleConfig() async {
    try{
      int modeType = 1;
      if(config.isGbet){
        modeType = 3;
      }
      var rsp  = await ModuleConfigReqProtocol(
        modeType: modeType,
      ).request();
      if(rsp?.code == 200){
        _checkTimer?.cancel();
        _modelConfig = rsp.model;
        _parseConfig();
        Event.eventBus.fire(ModuleSwitchChangeEvent(moduleCodes: []));
        _failCount = 0;
      } else {
        throw "getModuleConfig fail";
      }
    } catch(_){
      if(_failCount < _MaxFailCount){
        _failCount++;
        Future.delayed(Duration(seconds: 5),(){
          _getModuleConfig();
        });
      }
    } finally{
      // Future.delayed(Duration(seconds: config.fiexd.moduleConfigUpdatePeriod),(){
      //   if(!_exit){
      //     _getModuleConfig();
      //   }
      // });
    }
  }

  //检测模块配置数据是否已加载
  static void _checkModuleConfigLoadStatus(){
    _checkTimer = Timer.periodic(Duration(seconds: 180), (timer) {
      if(_moduleSwitch.isEmpty){
        _getModuleConfig();
      } else {
        timer?.cancel();
      }
    });
  }

  void startTimerModuleConfig(){
    _exit = false;
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(Duration(seconds: config.fiexd.moduleConfigUpdatePeriod), (timer){
      if(!_exit){
          _getModuleConfig();
        }
    });
  }


  ///退出
  void close(){
    _exit = true;
    _timer?.cancel();
    // _instance = null;
  }


  static void _parseConfig(){
    ///红包
    _moduleSwitch['${ModuleCode.hb}'] = _getSwitchStatus([ModuleCode.hb]);
    ///点水
    _moduleSwitch['${ModuleCode.ds}'] = _getSwitchStatus([ModuleCode.ds]);
    ///新闻模块
    _moduleSwitch['${ModuleCode.xwmk}'] = _getSwitchStatus([ModuleCode.xwmk]);
    ///动画直播
    _moduleSwitch['${ModuleCode.dhzb}'] = _getSwitchStatus([ModuleCode.dhzb]);
    ///视频&主播
    _moduleSwitch['${ModuleCode.spzb}'] = _getSwitchStatus([ModuleCode.spzb]);
    ///聊天室
    _moduleSwitch['${ModuleCode.lts}'] = _getSwitchStatus([ModuleCode.lts]);
    ///我的余额带出
    _moduleSwitch['${ModuleCode.yedc}'] = _getSwitchStatus([ModuleCode.yedc]);
    ///热投-整模块开启/关闭
    _moduleSwitch['${ModuleCode.rt}'] = _getSwitchStatus([ModuleCode.rt]);
    ///热投-点水开启/关闭
    _moduleSwitch['${ModuleCode.rtds}'] = true;//_getSwitchStatus([ModuleCode.rtds]);
    ///赛季排行-整模块开启/关闭
    _moduleSwitch['${ModuleCode.sjph}'] = _getSwitchStatus([ModuleCode.sjph]);
    ///跟投-整模块开启/关闭
    _moduleSwitch['${ModuleCode.gt}'] = _getSwitchStatus([ModuleCode.gt]);
    ///跟投-点水开启/关闭
    _moduleSwitch['${ModuleCode.gt}_${ModuleCode.gtds}'] = true;//_getSwitchStatus([ModuleCode.gt,ModuleCode.gtds]);
    ///收米快报-整模块开启/关闭
    _moduleSwitch['${ModuleCode.smkb}'] = _getSwitchStatus([ModuleCode.smkb]);
    ///收米快报-详情查看
    _moduleSwitch['${ModuleCode.smkb}_${ModuleCode.smxq}'] = _getSwitchStatus([ModuleCode.smkb,ModuleCode.smxq]);
    ///串关 - 整模块开启/关闭
    _moduleSwitch['${ModuleCode.cg}'] = _getSwitchStatus([ModuleCode.cg]);
    ///竞彩 - 整模块开启/关闭
    _moduleSwitch['${ModuleCode.jc}'] = _getSwitchStatus([ModuleCode.jc]);
    ///竞彩 - 点水开启/关闭
    _moduleSwitch['${ModuleCode.jc}_${ModuleCode.jcds}'] = true;//_getSwitchStatus([ModuleCode.jc,ModuleCode.jcds]);
    ///关注的比赛联赛卡片-整模块开启/关闭
    _moduleSwitch['${ModuleCode.gzsjkp}'] = _getSwitchStatus([ModuleCode.gzsjkp]);
    ///关注的比赛联赛卡片-点水开启/关闭
    _moduleSwitch['${ModuleCode.gzsjkp}_${ModuleCode.gzsjds}'] = true;//_getSwitchStatus([ModuleCode.gzsjkp,ModuleCode.gzsjds]);
    ///我的战况-整模块开启/关闭
    _moduleSwitch['${ModuleCode.wdzk}'] = _getSwitchStatus([ModuleCode.wdzk]);
    ///星座-整模块开启/关闭
    _moduleSwitch['${ModuleCode.xz}'] = _getSwitchStatus([ModuleCode.xz]);
    ///星座-推荐的比赛开启/关闭
    _moduleSwitch['${ModuleCode.xz}_${ModuleCode.xztj}'] = _getSwitchStatus([ModuleCode.xz,ModuleCode.xztj]);
    ///星座-点水开启/关闭
    _moduleSwitch['${ModuleCode.xz}_${ModuleCode.xzds}'] = true;//_getSwitchStatus([ModuleCode.xz,ModuleCode.xzds]);
    ///AI推球-整模块开启/关闭
    _moduleSwitch['${ModuleCode.AItq}'] = _getSwitchStatus([ModuleCode.AItq]);
    ///AI推球-点水开启/关闭
    _moduleSwitch['${ModuleCode.AItq}_${ModuleCode.AIds}'] = true;//_getSwitchStatus([ModuleCode.AItq,ModuleCode.AIds]);
    ///客服-整模块开启/关闭
    _moduleSwitch['${ModuleCode.kf}'] = _getSwitchStatus([ModuleCode.kf]);
    ///客服-资金开启/关闭
    _moduleSwitch['${ModuleCode.zj}'] = _getSwitchStatus([ModuleCode.zj]);
    ///客服-注单记录 开启/关闭
    _moduleSwitch['${ModuleCode.zdjl}'] = _getSwitchStatus([ModuleCode.zdjl]);
    ///冠军盘-开启/关闭
    _moduleSwitch['${ModuleCode.guanjun}'] = _getSwitchStatus([ModuleCode.guanjun]);
    ///埋点-开启/关闭
    _moduleSwitch['${ModuleCode.hkmd}'] = _getSwitchStatus([ModuleCode.hkmd]);
    ///游戏-开启/关闭
    _moduleSwitch['${ModuleCode.yx}'] = _getSwitchStatus([ModuleCode.yx]);
    ///新手教程-开启/关闭
    _moduleSwitch['${ModuleCode.xsjc}'] = _getSwitchStatus([ModuleCode.xsjc]);
    ///提前结算
    _moduleSwitch['${ModuleCode.tqjs}'] = _getSwitchStatus([ModuleCode.tqjs]);
    ///虚拟体育
    _moduleSwitch['${ModuleCode.xnty}'] = _getSwitchStatus([ModuleCode.xnty]);
    ///主播广告
    _moduleSwitch['${ModuleCode.hkzbgg}'] = _getSwitchStatus([ModuleCode.hkzbgg]);
    ///用户贡献榜
    _moduleSwitch['${ModuleCode.hkyhgxb}'] = _getSwitchStatus([ModuleCode.hkyhgxb]);
    ///礼物
    _moduleSwitch['${ModuleCode.gifts}'] = _getSwitchStatus([ModuleCode.gifts]);
    ///平台活动
    _moduleSwitch['${ModuleCode.pthd}'] = _getSwitchStatus([ModuleCode.pthd]);
    ///公众号
    _moduleSwitch['${ModuleCode.gzh}'] = _getSwitchStatus([ModuleCode.gzh]);
    //浮窗
    _moduleSwitch['${ModuleCode.fc}'] = _getSwitchStatus([ModuleCode.fc]);
    ///直播版
    _moduleSwitch['${ModuleCode.hzbb}'] = _getSwitchStatus([ModuleCode.hzbb]);
    ///多语言
    _moduleSwitch['${ModuleCode.dyy}'] = _getSwitchStatus([ModuleCode.dyy]);
    ///小视频
    _moduleSwitch['${ModuleCode.xsp}'] = _getSwitchStatus([ModuleCode.xsp]);
    ///论坛
    _moduleSwitch['${ModuleCode.bbs}'] = _getSwitchStatus([ModuleCode.bbs]);
    ///论坛
    _moduleSwitch['${ModuleCode.newbbs}'] = _getSwitchStatus([ModuleCode.newbbs]);
    ///意见反馈
    _moduleSwitch['${ModuleCode.yjfk}'] = _getSwitchStatus([ModuleCode.yjfk]);
    ///gbet-聊天室
    _moduleSwitch['${ModuleCode.gbet_lts}'] = _getSwitchStatus([ModuleCode.gbet_lts]);
    ///gbet-logo
    _moduleSwitch['${ModuleCode.gbet_logo}'] = _getSwitchStatus([ModuleCode.gbet_logo]);
    ///游戏底部弹框
    _moduleSwitch['${ModuleCode.yxdbtk}'] = _getSwitchStatus([ModuleCode.yxdbtk]);
    ///游戏消息推送
    _moduleSwitch['${ModuleCode.yxxxts}'] = _getSwitchStatus([ModuleCode.yxxxts]);
    ///游戏sdk下载
    _moduleSwitch['${ModuleCode.yxsdkxz}'] = _getSwitchStatus([ModuleCode.yxsdkxz]);
    _moduleSwitch['${ModuleCode.share_bet_order}'] = _getSwitchStatus([ModuleCode.share_bet_order]);
    _moduleSwitch['${ModuleCode.share_bet_order_kt}'] = _getSwitchStatus([ModuleCode.share_bet_order_kt]);

    ///单串合一串关
    _moduleSwitch['${ModuleCode.mixCombo}'] = _getSwitchStatus([ModuleCode.mixCombo]);

    ///单注投注活动提示
    _moduleSwitch['${ModuleCode.singleBetActivityTips}'] = _getSwitchStatus([ModuleCode.singleBetActivityTips]);
  }

  bool _getSwitch(List<String> codeLink){
    if(codeLink == null || codeLink.length == 0){
      return false;
    }
    if(_moduleSwitch == null || _moduleSwitch.length <= 0){
      return true;
    }
    String key = '';
    codeLink.forEach((code){
      key += '$code'+'_';
    });
    if(key.contains('_')){
      key = key.substring(0,key.length-1);
    }
    if(_moduleSwitch.containsKey(key)){
      return _moduleSwitch[key];
    }
    return false;
  }



  ///根据module code link获取模块或子模块的配置信息
  static ModuleConfig _queryModuleConfig(List<ModuleConfig> configs, List<String> codeLink){
    ModuleConfig config;
    if(codeLink != null && codeLink.isNotEmpty && configs != null){
      ModuleConfig codeConfig = configs.firstWhere((config){
        return config.code == codeLink[0];
      },orElse: (){
        return null;
      });
      if(codeLink.length == 1){
        config = codeConfig;
        return config;
      } else {
        if(codeConfig != null && codeConfig.childList != null){
          return _queryModuleConfig(codeConfig.childList, codeLink.sublist(1));
        }
      }
    }
    return config;
  }

  ///获取模块开关状态
  static bool _getSwitchStatus(List<String> codeLink){
    ModuleConfig moduleConfig = _queryModuleConfig(_modelConfig?.moduleConfigs, codeLink);
    if(moduleConfig == null){
      return true;
    }
    if(moduleConfig.enable == 1){
      return true;
    }
    return false;
  }



  //////////////////////////////////数据源开关////////////////////////////////////
  ///红包
  bool redPacket(){
    return _getSwitch([ModuleCode.hb]);
  }

  ///点水
  bool hitBet(){
    return _getSwitch([ModuleCode.ds]);
  }

  ///新闻模块
  bool news(){
    return _getSwitch([ModuleCode.xwmk]);
  }

  ///动画直播
  bool animationLive(){
    return _getSwitch([ModuleCode.dhzb]);
  }

  ///视频&主播
  bool videoAndAnchor(){
    return _getSwitch([ModuleCode.spzb]);
  }
  ///聊天室
  bool chatRoom(){
    return _getSwitch([ModuleCode.lts]);
  }
  ///我的余额带出
  bool myBalanceOut(){
    return _getSwitch([ModuleCode.yedc]);
  }


  /////////////////////////////////一级模块开关///////////////////////////////////
  ///冠军盘-整模块开启/关闭
  bool champion(){
    return _getSwitch([ModuleCode.guanjun]);
  }
  ///热投-整模块开启/关闭
  bool hotBet(){
    return _getSwitch([ModuleCode.rt]);
  }
  ///热投-点水开启/关闭
  bool hotBetHitBet(){
    return true;//_getSwitch([ModuleCode.rt,ModuleCode.rtds]);
  }
  ///赛季排行-整模块开启/关闭
  bool seasonRanking(){
    return _getSwitch([ModuleCode.sjph]);
  }
  ///跟投-整模块开启/关闭
  bool followBet(){
    return _getSwitch([ModuleCode.gt]);
  }
  ///跟投-点水开启/关闭
  bool followBetHitBet(){
    return true;//_getSwitch([ModuleCode.gt,ModuleCode.gtds]);
  }
  ///收米快报-整模块开启/关闭
  bool shouMi(){
    return _getSwitch([ModuleCode.smkb]);
  }
  ///收米快报-详情查看
  bool shouMiDetail(){
    return _getSwitch([ModuleCode.smkb,ModuleCode.smxq]);
  }
  ///串关 - 整模块开启/关闭
  bool combo(){
    return _getSwitch([ModuleCode.cg]);
  }
  ///竞彩 - 整模块开启/关闭
  bool guess(){
    return _getSwitch([ModuleCode.jc]);
  }
  ///竞彩 - 点水开启/关闭
  bool guessHitBet(){
    return true;//_getSwitch([ModuleCode.jc,ModuleCode.jcds]);
  }
  ///关注的比赛联赛卡片-整模块开启/关闭
  bool attentionMatchCard(){
    return _getSwitch([ModuleCode.gzsjkp]);
  }
  ///关注的比赛联赛卡片-点水开启/关闭
  bool attentionMatchCardHitBet(){
    return true;//_getSwitch([ModuleCode.gzsjkp,ModuleCode.gzsjds]);
  }
  ///我的战况-整模块开启/关闭
  bool myBetRecordSummary(){
    return _getSwitch([ModuleCode.wdzk]);
  }

  ///星座-整模块开启/关闭
  bool constellation(){
    return _getSwitch([ModuleCode.xz]);
  }
  ///星座-推荐的比赛开启/关闭
  bool constellationRecommendMatch(){
    return _getSwitch([ModuleCode.xz,ModuleCode.xztj]);
  }
  ///星座-点水开启/关闭
  bool constellationHitBet(){
    return true;//_getSwitch([ModuleCode.xz,ModuleCode.xzds]);
  }

  ///AI推球-整模块开启/关闭
  bool aiPushBoll(){
    return _getSwitch([ModuleCode.AItq]);
  }

  //金币
  bool wallet(){
    bool enable = _getSwitch([ModuleCode.zj]);
    return enable;
  }

  //订单记录
  bool orderRecordList(){
    bool enable = _getSwitch([ModuleCode.zdjl]);
    return enable;
  }

  ///AI推球-点水开启/关闭
  bool aiPushBollHitBet(){
    return true;//_getSwitch([ModuleCode.AItq,ModuleCode.AIds]);
  }

  ///客服-整模块开启/关闭
  bool customService(){
    return _getSwitch([ModuleCode.kf]);
  }
  ///埋点-整模块开启/关闭
  bool statisticsEvent() {
    return _getSwitch([ModuleCode.hkmd]);
  }

  //游戏
  bool game(){
    return _getSwitch([ModuleCode.yx]);
  }

   //新手教程
  bool noviceTutorial(){
    return _getSwitch([ModuleCode.xsjc]);
  }

  /// 提前结算
  bool earlySettle(){
    return _getSwitch([ModuleCode.tqjs]);
  }

  // 虚拟体育 - 快捷入口的虚拟体育
  bool virtualSport(){
    return _getSwitch([ModuleCode.xnty]);
  }

  // 主播广告
  bool anchorRank(){
    return _getSwitch([ModuleCode.hkzbgg]);
  }

  // 用户贡献榜
  bool userContributionRank(){
    return _getSwitch([ModuleCode.hkyhgxb]);
  }

  // 礼物
  bool gifts(){
    return _getSwitch([ModuleCode.gifts]);
  }

  // 公众号
  bool official () {
    return _getSwitch([ModuleCode.gzh]);
  }

  // 平台活动
  bool activity () {
    return _getSwitch([ModuleCode.pthd]);
  }

  //浮窗
  bool floatingWindow () {
    return _getSwitch([ModuleCode.fc]);
  }

  //直播版
  bool liveVersion () {
    return _getSwitch([ModuleCode.hzbb]);
  }

  //多语言
  bool multiLanguage () {
    return _getSwitch([ModuleCode.dyy]);
  }

  //小视频
  bool vlog () {
    return _getSwitch([ModuleCode.xsp]);
  }

  //论坛
  bool forum () {
    return _getSwitch([ModuleCode.bbs]);
  }

  //新论坛
  bool newForum () {
    return _getSwitch([ModuleCode.newbbs]);
  }

  //意见反馈
  bool feedback () {
    return _getSwitch([ModuleCode.yjfk]);
  }

  ///////// 小游戏 开关 /////////////
  // 游戏底部弹框
  bool gameYxdbtk () {
    return _getSwitch([ModuleCode.yxdbtk]);
  }

  // 游戏消息推送
  bool gameYxxxts () {
    return _getSwitch([ModuleCode.yxxxts]);
  }

  // 游戏sdk下载
  bool gameYxsdkxz () {
    return _getSwitch([ModuleCode.yxsdkxz]);
  }
  /////////////////////////////////////小金-gbet//////////////////
  //聊天室
  bool gbetLts () {
    return _getSwitch([ModuleCode.gbet_lts]);
  }

  //logo
  bool gbetLogo () {
    return _getSwitch([ModuleCode.gbet_logo]);
  }

  // 爆料
  bool shareBetOrder () {
    return _getSwitch([ModuleCode.share_bet_order]);
  }

  // 爆料-仅显示可投
  bool onlyShowCanBet () {
    return _getSwitch([ModuleCode.share_bet_order_kt]);
  }

  // 单串合一串关
  bool mixCombo () {
    return _getSwitch([ModuleCode.mixCombo]);
  }

  // 单注投注活动提示
  bool singleBetActivityTips () {
    return _getSwitch([ModuleCode.singleBetActivityTips]);
  }
}

class ModuleCode{
  ////////////////////////////////////数据源开关/////////////////////////////////
  // hb-红包
  static const String hb = 'hb';
  
  //ds-点水
  static const String ds = 'ds';

  //xwmk-新闻模块
  static const String xwmk = 'xwmk';

  //dhzb-动画直播
  static const String dhzb = 'dhzb';

  //spzb-视频&主播
  static const String spzb = 'spzb';

  //lts-聊天室
  static const String lts = 'lts';

  //yedc-我的余额带出
  static const String yedc = 'yedc';

  /////////////////////////////////////一级模块/////////////////////////////////
  //gjp-冠军盘
  static const String guanjun = 'guanjun';
  //rt-热投
  static const String rt = 'rt';
  //rt-热投-点水开启/关闭
  static const String rtds = 'rtds';

  //sjph-赛季排行
  static const String sjph = 'sjph';
  
  //gt-跟投
  static const String gt = 'gt';
  //gt-跟投-点水开启/关闭
  static const String gtds = 'gtds';

  //smkb-收米快报
  static const String smkb = 'smkb';
  //smkb-详情查看
  static const String smxq = 'smxq';

  //jc-竞彩
  static const String jc = 'jc';
  //jc-竞彩-点水开启/关闭
  static const String jcds = 'jcds';

  //cg-串关
  static const String cg = 'cg';

  //gzsjkp-关注的比赛联赛卡片
  static const String gzsjkp = 'gzsjkp';
  //gzsjkp-关注的比赛联赛卡片-点水开启/关闭
  static const String gzsjds = 'gzsjds';

  //wdzk-我的战况
  static const String wdzk = 'wdzk';

  //xz-星座
  static const String xz = 'xz';
  //xz-星座-推荐的比赛开启/关闭
  static const String xztj = 'xztj';
  //xz-星座-点水开启/关闭
  static const String xzds = 'xzds';

  //AItq-AI推球
  static const String AItq = 'AItq';
  //AItq-AI推球-点水开启/关闭
  static const String AIds = 'AIds';

  //kf-客服
  static const String kf = 'kf';

  //注单记录
  static const String zdjl = 'zdjl';

  //资金
  static const String zj = 'zj';
  //埋点
  static const String hkmd = 'hkmd';

  //yx-游戏
  static const String yx = 'yx';

  //xsjc-新手教程
  static const String xsjc = 'xsjc';

  //tqjs-提前结算
  static const String tqjs = 'tqjs';

  //xnty-虚拟体育
  static const String xnty = 'xnty';

  //hkzbgg-主播广告
  static const String hkzbgg = 'hkzbgg';

  //hkyhgxb-用户贡献榜
  static const String hkyhgxb = 'hkyhgxb';

  //gifts-礼物
  static const String gifts = 'gifts';

  // 公众号
  static const String gzh = 'gzh';

  // 平台活动
  static const String pthd = 'pthd';

  //浮窗
  static const String fc = 'fc';

  //直播版
  static const String hzbb = 'hzbb';

  //多语言
  static const String dyy = 'dyy';

  //小视频
  static const String xsp = 'xsp';

  //论坛
  static const String bbs = 'bbs';

  //新论坛
  static const String newbbs = 'newbbs';

  //意见反馈
  static const String yjfk = 'yjfk';

  ///////////// 小游戏通知 //////////////////////
  //游戏底部弹框
  static const String yxdbtk = 'yxdbtk';

  //游戏消息推送
  static const String yxxxts = 'yxxxts';

  //游戏sdk下载
  static const String yxsdkxz = 'yxsdkxz';

  /////////////////////////////////////小金-gbet//////////////////
  //gbet-聊天室
  static const String gbet_lts = 'Gbet_lts';

  //gbet-logo显示/隐藏
  static const String gbet_logo = 'Gbet_logo';

  // 爆料
  static const String share_bet_order = 'bl';

  // 爆料-仅显示可投
  static const String share_bet_order_kt = 'bl_kt';

  // 单串合一串关
  static const String mixCombo = 'mix_cg';

  // 单串合一串关
  static const String singleBetActivityTips = 'dzhdts';
}