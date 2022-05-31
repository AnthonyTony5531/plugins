/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-12-19
 * 说明：头部工具栏
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/
import 'dart:async';
import 'dart:ui';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/module_config/module_switch.dart';
//import 'package:fast_ai/config/module_statistics/module_statistics.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chatroom_bloc.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/base/panel_mixin.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/bottom_bar_controller.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/controller/tool_panel_controller.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/alert/text_explain_alert.dart';
import 'package:fast_ai/widgets/barrage/barrage_manager.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view.dart';
//import 'package:fast_ai/widgets/common_match/time_view/time_view_style.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volume_plugin/volume_plugin.dart';

class LiveBottomBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final BottomBarController controller;
  final Size size;
  final bool isFreeAnchor;
  final bool isFreeLiveGameAnchor; // 游戏自由播正在播

  LiveBottomBar({
    Key key,
    @required this.controller,
    @required this.size,
    @required this.onChanged,
    this.isFreeAnchor = false,
    this.isFreeLiveGameAnchor = false,
  }) : assert(controller != null);

  @override
  _LiveBottomBarState createState() => _LiveBottomBarState();
}

class _LiveBottomBarState extends State<LiveBottomBar>
    with TickerProviderStateMixin {
  void fresh() {
    setState(() {});
  }

  BottomBarController get controller => widget.controller;
  ToolPanelController get toolPanel => controller.toolPanel;
  BottomBarTextController get textController => toolPanel.bottomBarTextController;

  AnimationController _animationController;

  StreamSubscription<DetailVideoEvent> detailVideoEvent;

  void listenDetailMatchViewEvent() async {
    detailVideoEvent = Event.eventBus.on<DetailVideoEvent>().listen((event) {
      print('播放视频关闭-------111:${event?.state}');
      // 不满足投注额时停止视频播放
//      num currentBetGold = config?.userInfo?.currLaunchAllBetGold ?? 0;
//      num betTotal = config?.userInfo?.roomFirstBettingTotal ?? 0;
      num currentBetGold = config?.userInfo?.videoCurrAllBetGold ?? 0;
      num betTotal = config?.userInfo?.videoBettingTotal ?? 0;
      if(betTotal > 0 && betTotal > currentBetGold){
        if(config.userInfo.isAlreadyShowBetHint){
          if(toolPanel.videoPlayer.player.isOk){
            print('播放视频关闭-------222:${event?.state}');
            config.userInfo.recordVideoStatus = 'stop';
            toolPanel.videoPlayer.player.pause();
          }
          return;
        }
      }
      if(betTotal <= 0 && config.userInfo.watchLiveTime == 0){
        if(toolPanel.videoPlayer.player.isOk){
          print('播放视频关闭-------333:${event?.state}');
          config.userInfo.recordVideoStatus = 'stop';
          toolPanel.videoPlayer.player.pause();
        }
        return;
      }
      //playing,stop
      if (event.state == 'playing') {
        print('播放视频关闭-------444:${event?.state}');
        if(toolPanel.videoPlayer.player.isPlaying){
          return;
        }
        print('播放视频关闭-------555:${event?.state}');
        config.userInfo.recordVideoStatus = 'playing';
        toolPanel.videoPlayer.player.start();
      } else {
        if(toolPanel.videoPlayer.player.isOk){
          print('播放视频关闭-------666:${event?.state}');
          config.userInfo.recordVideoStatus = 'stop';
          toolPanel.videoPlayer.player.pause();
        }
      }
    });
  }

  StreamSubscription<AiVideoState> _videoStateListener;
  @override
  void initState() {
    listenDetailMatchViewEvent();

    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    toolPanel.bottomBar.videoTypeChanged.addListener(onVideoTypeChanged);
    _videoStateListener = toolPanel.videoPlayer.player.onVideoState.listen(onPlayStateChanged);
    controller.animationController = _animationController;
    textController.onPanel = onPanel;
    initVolume();
  }

  @override
  void dispose() {
    detailVideoEvent?.cancel();
    volumetimer?.cancel();
    toolPanel.bottomBar.videoTypeChanged.removeListener(onVideoTypeChanged);
    _videoStateListener.cancel();
    _videoStateListener = null;
    _animationController?.dispose();
    controller?.animationController = null;
    textController.onPanel = null;
    super.dispose();
  }

  void onPanel(PanelActionModel action) {
    switch(action.type) {
      case PanelActionType.fresh : {
        fresh();
        break;
      }
      case PanelActionType.setText : {
        textEditingController.text = action.value;
        break;
      }
      default : {
        break;
      }
    }
  }

  onVideoTypeChanged(VideoType videoType) {
    controller.update();
  }

  // TODO: 改用AiVideoState
  //onPlayStateChanged(AiWebVideoPlayerState state) {
  onPlayStateChanged(AiVideoState state) {
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    controller.animationController = _animationController;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(0, 80 * _animationController.value),
          child: StreamBuilder<LiveBottombarModel>(
            initialData: widget.controller.model,
            stream: widget.controller.stream(),
            builder: (context, as) {
              return _createBody(context, as.data);
            },
          ),
        );
      },
    );
  }

  Widget _createBody(BuildContext context, LiveBottombarModel model) {
    if (model == null) {
      return Container();
    }
    var isNotVideo = (controller.toolPanel.bottomBar.model.videoType != VideoType.Video);
    if (isNotVideo) {
      BarrageManager.get().close();
      BarrageManager.get().clear();
    }

    var body = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
            width: MediaQuery.of(context).size.width-12,
            bottom: 0,
            left: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    isNotVideo ? Container() : createPlayStateButton(model),
                    if(!isNotVideo) SizedBox(width:10.0),
                    isNotVideo || !controller.model.enableShowRefreshButton
                        ? Container() :
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child:  ClipOval(
                                child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.4)),
                                    child: createFreshButton())),
                          ),
                    isNotVideo || !controller.model.enableShowFullScreen  || widget.isFreeAnchor
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(right: 10),
                            child: createChangeVideo(model),
                          ),
                  ],
                ),
                isNotVideo || !controller.model.enableShowFullScreen || widget.isFreeLiveGameAnchor
                    ? Container()
                    : createScreenSetting(model),
                // InterValHelper.w(10),
              ],
            )),
      ],
    );
    return Container(
      height: 80,
      width: widget.size.width,
      decoration: BoxDecoration(
        // color: Colors.blue,
        gradient: LinearGradient(colors: [
          Color(0x00000000),
          Color(0xB0000000),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: controller.model.screenDirection == ScreenDirection.TopDown
          ? body
          : leftRightWidget(),
    );
  }

  //横竖屏
  Widget leftRightWidget() {

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          createPlayStateButton(controller.model),
          InterValHelper.w(14),
          createFreshButton(),
          InterValHelper.w(14),
          createVoiceButton(),
          InterValHelper.w(14),
          createAnchorInfoWidget(),
          InterValHelper.w(14),
          createBarrageButton(controller.model),
          InterValHelper.w(14),
          Show(isShow: ModuleSwitch.getInstance().chatRoom(), child: createInputSwitchButton()),
          InterValHelper.w(14),
          createScoreButton(),
          InterValHelper.w(14),
          createMatchDataButton(),
          InterValHelper.w(14),
          createMoreButton(),
        ],
      ),
    );
  }

  TextEditingController textEditingController = new TextEditingController();

  //创建输入框拉起按钮
  Widget createInputSwitchButton() {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (Hooks.ins.isBlocked(HookName.ClickChatRoomInput, {})) return;
          print("createInputSwitchButton");
          toolPanel.chatBarController.showBroad();
          widget.controller.toolPanel.hotHelperController.hide();
        },
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  height: double.infinity,
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  child: TextHelper.buildNormal(
                      config.langMap['baseLang']['detail']['livePlayer']
                          ['barrageGo'],
                      textColor: Colors.black.withOpacity(0.3).value)),
              InkWell(
                  onTap: () {
                    if (Hooks.ins.isBlocked(HookName.ClickChatRoomInput, {}))
                      return;
                    if (!ChatRoomBloc.hasPermission2SendMessage &&
                        ChatRoomBloc.bettingTotal > 0) {
                      TextAlert.of(context).showAlert(
                          message:
                              '${config.langMap['baseLang']['detail']['chatroom']['permissionMessagePrefix']}${ChatRoomBloc.bettingTotal ?? 1}${config.langMap['baseLang']['detail']['chatroom']['permissionMessageSuffix']}');
                      return null;
                    }
                    controller.toolPanel.hotHelperController.show();
                    setState(() {});
                  },
                  child: Row(
                    children: <Widget>[
                      TextHelper.buildNormal(
                          config.langMap['baseLang']['detail']['livePlayer']
                              ['hotExpression'],
                          textColor: Colors.black.withOpacity(0.5).value),
                      Icon(
                        controller.toolPanel.hotHelperController.isShow
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 12,
                      ),
                      InterValHelper.w(16),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget createFreshButton() {
    return InkWell(
      onTap: () async {
        // TODO: 等播放器开发reload方法
        controller.videoPlayer.player.replay();
      },
      child: Stack(
        children: <Widget>[
          Align(
            child: AiSvgPicture.asset(
              'assets/images/liveplayer/icon_live_refuse_normal.svg',
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }

//  Widget createPingButton() {
//    String img ;
//    if(!widget.toolPanelController.bottomBar.getPingStatus()){
//      img = 'assets/images/liveplayer/icon_pushpin.svg';
//    } else {
//      img = 'assets/images/liveplayer/icon_pushpin_un.svg';
//    }
//    return InkWell(
//      onTap: () {
//        widget.toolPanelController.bottomBar.setPingStatus(!widget.toolPanelController.bottomBar.getPingStatus());
//        if(mounted){
//          setState(() {
//
//          });
//        }
//      },
//      child: Stack(
//        children: <Widget>[
//          Align(
//            child: AiSvgPicture.asset(
//              img,
//              width: 24,
//              height: 24,
//            ),
//          )
//        ],
//      ),
//    );
//  }

  bool isMute = false;
  //保证移除静音时候有声音，用来存储大于0的音量
  double pressVolume = 0.5;
  bool isSettingVoice = false;
  Widget createVoiceButton() {
    return InkWell(
      onTap: () async {
        if (isSettingVoice) return;
        isSettingVoice = true;
        isMute = !isMute;
        setState(() {});

        if (isMute) {
          var currentVolume =
              await VolumePlugin.getCurrentVolume(streamType: StreamType.music);
          //如果pressVolume有值，那么存储起来，
          if (currentVolume > 0) {
            pressVolume = currentVolume;
          }
          VolumePlugin.setCurrentVolume(
              streamType: StreamType.music, value: 0.0);
          print("createVoiceButton isMute $pressVolume");
        } else {
          print("createVoiceButton isNotMute $pressVolume");

          await VolumePlugin.setCurrentVolume(
              streamType: StreamType.music, value: pressVolume ?? 0.0);
        }
        isSettingVoice = false;
      },
      child: AiSvgPicture.asset(
        !isMute
            ? 'assets/images/liveplayer/icon_live_vioce_on.svg'
            : 'assets/images/liveplayer/icon_live_vioce_off.svg',
        height: 24,
      ),
    );
  }

  Widget createScoreButton() {
    if(widget.isFreeAnchor){
      return sw(34);
    }
    return InkWell(
      onTap: () {
        toolPanel.hide();
        toolPanel.historyController.show();
      },
      child: AiSvgPicture.asset(
        'assets/images/liveplayer/icon_live_outs_normal.svg',
        height: 32,
      ),
    );
  }

  Widget createMoreButton() {
    if(widget.isFreeAnchor){
      return sw(34);
    }
    return InkWell(
      onTap: () {
        toolPanel.hide();
        toolPanel.moreLeagueController.show();
      },
      child: AiSvgPicture.asset(
        'assets/images/liveplayer/icon_live_morematch_normal.svg',
        height: 32,
      ),
    );
  }

  Widget createMatchDataButton() {
    if(widget.isFreeAnchor){
      return sw(34);
    }
    return InkWell(
      onTap: () {
        toolPanel.hide();
        toolPanel.matchStationController.show();
      },
      child: AiSvgPicture.asset(
        'assets/images/liveplayer/icon_live_data_normal.svg',
        height: 32,
      ),
    );
  }

  Widget createAnchorWidget() {
    var isNotVideo = (controller.toolPanel.bottomBar.model.videoType != VideoType.Video);
    return isNotVideo
        ? Container()
        : createPlayer(this.controller.model);
  }

  Widget createAnchorInfoWidget() {
    var isNotVideo = (controller.toolPanel.bottomBar.model.videoType != VideoType.Video);
    var nickName = controller.toolPanel.anchorSelectorFull.model?.currentAnchor?.nickName ?? "";
    return isNotVideo || widget.isFreeAnchor
        ? Container()
        : InkWell(
            onTap: () {
              if(widget.isFreeAnchor){
                return;
              }
              print("createAnchorInfoWidget ");
              toolPanel.hide();
              controller.anchorSelectorTap.fire();
            },
            child: Container(
              height: 24,
              padding: EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
              child: IntrinsicWidth(
                child: Row(
                  children: <Widget>[
                    createAnchorHeader(),
                    InterValHelper.w(4),
                    Expanded(
                      child: TextHelper.buildNormal(nickName,
                          textColor: Colors.white.value),
                    ),
                    Show(
                      isShow:!widget.isFreeAnchor,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget createAnchorHeader() {
    var headImg = controller.toolPanel.anchorSelectorFull.model
            ?.currentAnchor?.headImg ??
        "";

    return Container(
        child: isNullOrEmpty(headImg)
            ? ClipOval(
                child: Container(
                width: 24,
                height: 24,
                child: AiImage.asset(
                    "assets/images/liveplayer/icon_live_video_play.png"),
              ))
            : AiImage.userLogo(headImg, size: 24));
  }

  Widget createBarrageButton(LiveBottombarModel model) {
    var img = BarrageManager.get().showable
        ? 'assets/images/liveplayer/icon_live_bullet_normal.svg'
        : 'assets/images/liveplayer/icon_live_bullet_close.svg';
    return InkWell(
      onTap: () {
//        ModuleStatistics.ins
//            .statisticsEvent(StatisticsType.StatisticsDetailForbidMessageQueue);
        if (BarrageManager.get().showable) {
          BarrageManager.get().close();
          BarrageManager.get().clear();
        } else {
          BarrageManager.get().show();
        }
        setState(() {
          debugPrint("$img");
        });
      },
      child: Container(
        width: 26,
        height: 26,
        margin: EdgeInsets.only(right: 8, left: 8),
//          decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color: Colors.black.withOpacity(0.4)
//          ),
        child: Container(
          child: AiSvgPicture.asset(
            img,
            width: 26,
            height: 26,
          ),
        ),
      ),
    );
  }

  Widget createPlayStateButton(LiveBottombarModel model) {
    var img = '';
    var playerState = controller.videoPlayer.player.state;
    switch (playerState) {
      case AiVideoState.initialized:
      case AiVideoState.asyncPreparing:
      case AiVideoState.prepared:
      case AiVideoState.started:
        img = 'assets/images/liveplayer/icon_live_suspend_normal.svg';
        break;
      case AiVideoState.completed:
      // TODO: Handle this case.
      default :
        img = 'assets/images/liveplayer/icon_live_start_normal.svg';
        break;
    }


    return InkWell(
      onTap: () async {
        switch (playerState) {
          case AiVideoState.initialized:
          case AiVideoState.asyncPreparing:
          case AiVideoState.prepared:
          case AiVideoState.started:
            await controller.videoPlayer.player.pause();
            break;
          case AiVideoState.completed:
          // TODO: Handle this case.
          default :
            await controller.videoPlayer.player.start();
            break;
        }
      },
      child: createImageButton(img)
    );
  }

  Widget createPlayer(LiveBottombarModel model) {
    var nickName = controller.toolPanel.anchorSelectorFull.model?.currentAnchor?.nickName ?? "";
    var headImg = controller.toolPanel.anchorSelectorFull.model?.currentAnchor?.headImg ?? "";
    var anchorId = controller.toolPanel.anchorSelectorFull.model?.currentAnchor?.vid ?? "";

    return InkWell(
      onTap: () {
        controller.anchorSelectorTap.fire();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withOpacity(0.5)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isNullOrEmpty(headImg)
                    ? ClipOval(
                        child: Container(
                        width: 24,
                        height: 24,
                        child: AiImage.asset(
                            "assets/images/liveplayer/icon_live_video_play.png"),
                      ))
                    : InkWell(
                        child: AiImage.userLogo(headImg, size: 24),
                        onTap: () {
                          //showMaterialPageRoute(context, AnchorHomePage(anchorId: anchorId));
                          controller.anchorSelectorTap.fire();
                        },
                      ),
                Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: Text(
                    nickName ?? "",
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.pingFang,
                        fontSize: config.skin.fontSize.h5,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createVideoTypeSetting(LiveBottombarModel model) {
    var img = "assets/images/liveplayer/icon_live_setting_normal.svg";
    return InkWell(
        onTap: () {
          if (controller.toolPanel.videoSelector.isShow) {
            controller.toolPanel.videoSelector.hide();
          } else {
            controller.settingTap.fire();
          }
        },
        child: createImageButton(img));
  }

  Widget createAudioSetting(LiveBottombarModel model) {
    var img = '';
    if (model.autioState == AutioState.Mute) {
      img = 'assets/images/liveplayer/icon_live_vioce_off.svg';
    } else {
      img = 'assets/images/liveplayer/icon_live_vioce_on.svg';
    }
    return InkWell(
        onTap: () async {
          if (mounted) {
            setState(() {});
            switch (model.autioState) {
              case AutioState.Mute:
                model.autioState = AutioState.Voice;
                await widget.controller.videoPlayer.player.open();
                break;
              case AutioState.Voice:
                model.autioState = AutioState.Mute;
                await widget.controller.videoPlayer.player.mute();
                break;
            }
            controller.autioStateChanged.fire(model.autioState);
          }
        },
        child: createImageButton(img));
  }

  Widget createChangeVideo(LiveBottombarModel model) {
    var img = 'assets/images/liveplayer/icon_detail_video_swotch.svg';
    return InkWell(
        onTap: () {
          if (mounted) {
            setState(() {
              Event.eventBus.fire(LiveChangeEvent(isShowLivePanel: true));
            });
          }
        },
        child: createImageButton(img));
  }

  Widget createScreenSetting(LiveBottombarModel model) {
    var img = '';
    if (model.screenDirection == ScreenDirection.TopDown) {
      img = 'assets/images/liveplayer/icon_detail_video_screen.svg';
      //img = 'assets/images/liveplayer/icon_live_screen_transverse.svg';
    } else {
      img = 'assets/images/liveplayer/icon_detail_video_exit.svg';
      //img = 'assets/images/liveplayer/icon_live_screen_vertical.svg';
    }
    //print('00-live_bottombar-direction0=${model.screenDirection}');
    return InkWell(
        onTap: () {
          if (mounted) {
//            ModuleStatistics.ins
//                .statisticsEvent(StatisticsType.StatisticsDetailLandscape);
            setState(() {
              print('11-live_bottombar-direction0=${model.screenDirection}');
              switch (model.screenDirection) {
                case ScreenDirection.TopDown:
                  {
                    print(
                        '22-live_bottombar-direction0=${model.screenDirection}');
//                    OrientationPlugin.forceOrientation(
//                        DeviceOrientation.landscapeRight);
                    SystemChrome.setPreferredOrientations([
                      defaultTargetPlatform == TargetPlatform.android
                          ? DeviceOrientation.landscapeLeft
                          : DeviceOrientation.landscapeRight
                    ]);
                  }
                  break;
                case ScreenDirection.LeftRight:
                  {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.portraitUp,
                    ]).whenComplete(() {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown,
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                      ]);
                    });
                  }
                  break;
              }
            });
            controller.screenDirectionChanged.fire(model.screenDirection);
          }
        },
        child: createImageButton(img,right: 10));
  }

  Widget createImageButton(String img,
      {double bottom = 10,
      double top = 10,
      double left = 0,
      double right = 0}) {
    return ClipOval(
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.black.withOpacity(0.4)),
        margin:
            EdgeInsets.only(bottom: bottom, top: top, left: left, right: right),
        child: Stack(
          children: <Widget>[
            Align(
              child: AiSvgPicture.asset(
                img,
                width: 24,
                height: 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createTeamName(LiveBottombarModel model) {
    var teamRow = Row(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            maxWidth: 70,
          ),
          margin: EdgeInsets.only(bottom: 5),
          child: Text(model.homeName,
              textAlign: TextAlign.end,
              style: AiTextStyle(
                  fontFamily: config.skin.fontFimaly.pingFang,
                  fontSize: config.skin.fontSize.h5,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis),
        ),
        isGoalEmpty(model)
            ? Container()
            : Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(model.homeGoal,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.dINCondensed,
                        fontSize: config.skin.fontSize.h3,
                        color: Color(0xFFFF4000))),
              ),
        Container(
            margin: isGoalEmpty(model)
                ? EdgeInsets.only(bottom: 5)
                : EdgeInsets.only(),
            width: isGoalEmpty(model) ? 15 : 10,
            child: isGoalEmpty(model)
                ? Text(
                    "vs",
                    style: config.skin.game.vsStyle,
                    textAlign: TextAlign.center,
                  )
                : Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      ":",
                      style: AiTextStyle(
                          fontFamily: config.skin.fontFimaly.pingFang,
                          fontSize: config.skin.fontSize.h4,
                          color: Color(0xFFFF4000)),
                      textAlign: TextAlign.center,
                    ),
                  )),
        isGoalEmpty(model)
            ? Container()
            : Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(model.awayGoal,
                    style: AiTextStyle(
                        fontFamily: config.skin.fontFimaly.dINCondensed,
                        fontSize: config.skin.fontSize.h3,
                        color: Color(0xFFFF4000))),
              ),
        Container(
          constraints: BoxConstraints(
            maxWidth: 70,
          ),
          margin: EdgeInsets.only(bottom: 5),
          child: Text(model.awayName,
              style: AiTextStyle(
                  fontFamily: config.skin.fontFimaly.pingFang,
                  fontSize: config.skin.fontSize.h5,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis),
        ),
//        Container(
//          margin: EdgeInsets.only(bottom: 5, left: 10),
//          child: TimeView(
//              model: model.timeViewModel,
//              style: TimeViewStyle(
//                  textStyle: AiTextStyle(
//                      color: Colors.white,
//                      fontFamily: config.skin.fontFimaly.pingFang,
//                      fontSize: config.skin.fontSize.h5,
//                      fontWeight: config.skin.fontWeight.regular,
//                      height: 1.1))),
//        )
      ],
    );
    return teamRow;
  }

  bool isGoalEmpty(LiveBottombarModel model) {
    return isNullOrEmpty(model.homeGoal) && isNullOrEmpty(model.awayGoal);
  }

  Timer volumetimer;
  double _currentVolume = 0;

  bool isInit = false;
  void initVolume() async {
    volumetimer = Timer.periodic(Duration(milliseconds: 500), (timer) async {
      if (mounted) {
        var volumn =
            await VolumePlugin.getCurrentVolume(streamType: StreamType.music);
        if (_currentVolume != volumn) {
          _currentVolume = volumn;
          isMute = _currentVolume == 0;
          setState(() {});
        }
      }
    });
  }
}
