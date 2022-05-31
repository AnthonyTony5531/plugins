import 'dart:async';
import 'dart:typed_data';

import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/performance/manager/logger_kit_manager.dart';
import 'package:fast_ai/utils/ai_level.dart';
import 'package:fast_ai/widgets/imagecache/xc_cache_file_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/input_chat_room_barrage_manager.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/chat_user.dart';
import 'package:fast_ai/pages/detail/chatroom/message/widget/chat_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:fast_ai/widgets/imagecache/xc_network_image.dart' as xcNetworkImage;

///
/// 进入聊天室弹幕
///
class InputChatRoomBarrageWidget extends StatefulWidget {
  final String name;
  final bool isFreeAnchor;
  final InputChatRoomBarrageManager manager;

  InputChatRoomBarrageWidget({Key key, this.name, this.isFreeAnchor, this.manager}) : super(key: key);

  @override
  _InputChatRoomBarrageWidgetState createState() => _InputChatRoomBarrageWidgetState();
}

class _InputChatRoomBarrageWidgetState extends State<InputChatRoomBarrageWidget> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _tween;
  InputChatRoomBarrageManager _manager;
  ChatUser _chatUser;

  Timer _timer;
  bool _showing = false;
  bool _isSenior = false;

  @override
  void initState() {
    super.initState();
    _manager = widget.manager ?? InputChatRoomBarrageManager.ins();
    _manager?.addBarRangeChangeListener(barRangeChangeListener);

    _controller = new AnimationController(duration: const Duration(milliseconds: 300), vsync: this);

    _tween = new Tween(begin: -400.0, end: 20.0).animate(_controller);
    _tween.addListener(tweenListener);
    _tween.addStatusListener(statusListener);

    //首次进来显示自己
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sleep(200, () {
        barRangeChangeListener();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tween?.removeListener(tweenListener);
    _tween?.removeStatusListener(statusListener);
    _manager?.removeBarRangeChangeListener(barRangeChangeListener);
    _controller?.dispose();
    _manager?.clear();
    super.dispose();
  }

  void tweenListener() {
    if (mounted) setState(() {});
  }

  void statusListener(status) {
    if (status == AnimationStatus.forward) {
      _showing = true;
    } else if (status == AnimationStatus.completed) {
      _timer?.cancel();
      _timer = Timer(const Duration(milliseconds: 5000), () {
        _controller?.reverse();
      });
    } else if (status == AnimationStatus.dismissed) {
      _showing = false;
      //显示完成后移除
      _manager.removeData(_chatUser);
    }
  }

  void barRangeChangeListener() {
    if (!_showing) {
      final nextUser = _manager?.getFirst();
      if (nextUser != null) {
        _chatUser = nextUser;
        _isSenior = _chatUser.level > 4;
        if (mounted) {
          _controller?.forward();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showing) {
      return buildNormal();
    }
    // return buildNormal();
    // return _seniorInputHeaderInfoView();
    // return _normalInputHeaderInfoView();
    return const SizedBox();
  }

  Widget buildNormal() {
    var inputRoomInfo = config.langMap['baseLang']['detail']['chatroom']['entryLiveRoom'];
    final rankType = _chatUser?.rankType ?? 0; // 榜单类型
    final rankIndex = _chatUser?.rankIndex ?? 0; // 榜排名
    final rankJsonImg = _chatUser?.rankAnimationImg;
    final userLevel = _chatUser?.level ?? 0;
    final userName = _chatUser?.showName ?? config.langMap['baseLang']['member']['userInfo']['nickName'];

    final isFree = widget.isFreeAnchor ?? true;
    final rankName = getRankTypeName(rankType, isFree);
    final indexName = getRankIndexName(rankIndex, isFree);
    final rankAnimationImg = getRankAnimationImg(rankType, rankIndex, rankJsonImg, isFree);

    // final rankName = '';
    // final indexName = '';
    // final rankAnimationImg = '';
    // 得榜者
    if (rankName != null && rankName.length != 0 && indexName != null && indexName.length != 0) {
      inputRoomInfo = inputRoomInfo.toString().replaceAll('进入', '光临').replaceAll('進入', '光臨');
    }
    final shortName = maxLengthString(userName, _isSenior ? 6 : 8);
    final color = AiLevel.getColorByLevel(userLevel);
    return Transform.translate(
      offset: Offset(_tween.value, 0),
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        constraints: BoxConstraints(minWidth: 140.0, maxWidth: 220.0, maxHeight: isEmpty(rankAnimationImg)?50:210.0, minHeight: 40.0),
        child: Column(
          mainAxisSize: isEmpty(rankAnimationImg) ? MainAxisSize.min: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isSenior
                ? _seniorInputHeaderInfoView(rankName, indexName, shortName, inputRoomInfo, userLevel, color)
                : _normalInputHeaderInfoView(rankName, indexName, shortName, inputRoomInfo),
            _rankAnimationImgView(rankAnimationImg),
          ],
        ),
      ),
    );
  }

  Widget _normalInputHeaderInfoView(
    String rankName,
    String rankIndex,
    String shortName,
    String inputRoomInfo,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, top: 4.0, bottom: 5.0, right: 12.0),
      decoration: BoxDecoration(
        color: Color(0xffFE5888).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$rankName$rankIndex',
              style: AiTextStyle(
                color: Color(0xffFE5888),
                fontSize: config.skin.fontSize.h5,
                decoration: TextDecoration.none,
                fontWeight: config.skin.fontWeight.regular,
                height: 1.2,
              ),
            ),
            TextSpan(text: shortName),
            TextSpan(
              text: ' $inputRoomInfo',
              style: AiTextStyle(
                color: config.skin.colors.fontColorWhite,
                fontSize: config.skin.fontSize.h5,
                decoration: TextDecoration.none,
                fontWeight: config.skin.fontWeight.regular,
                height: 1.2,
              ),
            ),
          ],
          style: AiTextStyle(
            color: Color(0xFF5078FF),
            fontSize: config.skin.fontSize.h5,
            decoration: TextDecoration.none,
            fontWeight: config.skin.fontWeight.regular,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _seniorInputHeaderInfoView(
    String rankName,
    String rankIndex,
    String shortName,
    String inputRoomInfo,
    int userLevel,
    Color bgCol,
  ) {
    return Container(
      height: 40.0,
      constraints: BoxConstraints(minWidth: 140.0, maxWidth: 220.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [bgCol, bgCol.withAlpha(0)],
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 40,
            padding: EdgeInsets.only(left: 12.0, right: 6.0),
            child: ChatImage.levelHeadBuild(userLevel, width: 36.0, height: 40.0),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$rankName$rankIndex',
                  style: AiTextStyle(
                    color: Color(0xffFE5888),
                    fontSize: config.skin.fontSize.h5,
                    decoration: TextDecoration.none,
                    fontWeight: config.skin.fontWeight.regular,
                    height: 1.2,
                  ),
                ),
                TextSpan(text: shortName),
                TextSpan(text: '\n'),
                TextSpan(
                  text: inputRoomInfo,
                  style: AiTextStyle(
                    color: config.skin.colors.fontColorWhite,
                    fontSize: config.skin.fontSize.h5,
                    decoration: TextDecoration.none,
                    fontWeight: config.skin.fontWeight.regular,
                    height: 1.2,
                  ),
                ),
              ],
              style: AiTextStyle(
                color: Color(0xff5078FF),
                height: 1.2,
                fontSize: config.skin.fontSize.h5,
                decoration: TextDecoration.none,
                fontWeight: config.skin.fontWeight.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rankAnimationImgView(String image) {
    if (image == null || image.length == 0) return const SizedBox();
    final isSvga = image.contains('svga');
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: 160.0,
        height: 160.0,
        child: isSvga ? _SVGASimpleImage(resUrl: image) : AiImage.fromUrl(image, '', BoxFit.fill),
      ),
    );
  }

  String getRankTypeName(int listType, bool isFreeAnchor) {
    if (isFreeAnchor) return '';
    if (listType == 1) return config.langMap['baseLang']['detail']['chatroom']['tycoon_leaderboard'] ?? '豪气榜';
    if (listType == 2) return config.langMap['baseLang']['detail']['chatroom']['reward_leaderboard'] ?? '打赏榜';
    if (listType == 3) return config.langMap['baseLang']['detail']['chatroom']['seven_days_leaderboard'] ?? '7天榜';
    return '';
  }

  String getRankIndexName(int listRank, bool isFreeAnchor) {
    if (isFreeAnchor) return '';
    if (listRank == 1) return config.langMap['baseLang']['detail']['chatroom']['rank_first'] ?? '第一';
    if (listRank == 2) return config.langMap['baseLang']['detail']['chatroom']['rank_second'] ?? '第二';
    if (listRank == 3) return config.langMap['baseLang']['detail']['chatroom']['rank_third'] ?? '第三';
    return '';
  }

  // 测试用 : http://dev.img.yc365d.com//FE/common/chatroom/01_02.gif
  String getRankAnimationImg(int listType, int listRank, String jsonObj, bool isFreeAnchor) {
    if (isFreeAnchor) return '';
    if (jsonObj == null) return '';
    if (!jsonObj.startsWith("http")) {
      if (jsonObj.startsWith('/'))
        return "${Api.baseImgUrl}$jsonObj";
      else
        return "${Api.baseImgUrl}/$jsonObj";
    }
    return jsonObj;
  }
}

class _SVGASimpleImage extends StatefulWidget {
  final String resUrl;

  _SVGASimpleImage({Key key, this.resUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SVGASimpleImageState();
  }
}

class _SVGASimpleImageState extends State<_SVGASimpleImage> with SingleTickerProviderStateMixin {
  static final XcCacheFileImage _cacheFileImage = XcCacheFileImage();
  SVGAAnimationController animationController;
  bool isChange = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this);

    _loadResUrl();
  }

  @override
  Widget build(BuildContext context) {
    if (isChange) return const SizedBox();
    return SVGAImage(this.animationController);
  }

  @override
  void didUpdateWidget(covariant _SVGASimpleImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.resUrl != widget.resUrl || isChange) {
      _loadResUrl();
    }
  }

  @override
  void dispose() {
    this.animationController.videoItem = null;
    this.animationController.dispose();
    super.dispose();
  }

  Future<void> _loadResUrl() async {
    if (isLoading) return;
    isLoading = true;
    isChange = true;
    _uploadView();

    var videoItem;
    final Uint8List cacheBytes = await _cacheFileImage.getFileBytes(widget.resUrl);
    if (cacheBytes != null) {
      videoItem = await SVGAParser.shared.decodeFromBuffer(cacheBytes.toList());
    } else {
      xcNetworkImage.NetworkImage(widget.resUrl).preLoad();
      videoItem = await SVGAParser.shared.decodeFromURL(widget.resUrl);
    }

    if (videoItem != null && mounted) {
      this.animationController
        ..videoItem = videoItem
        ..repeat();
    }
    isLoading = false;
    isChange = false;
    _uploadView();
  }

  void _uploadView() {
    if (mounted) setState(() {});
  }
}
