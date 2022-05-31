import 'package:fast_ai/api/net.dart';
import 'package:fast_ai/api/protocols/anchor/anchor_dynamicList.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/sdk_params.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/personal/play_info.dart';
import 'package:fast_ai/pages/detail/head/new_head/anchor_follow_card.dart';
//import 'package:fast_ai/models/personal/play_info.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_card_body_blank.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_card_protocol.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_report.dart';
//import 'package:fast_ai/pages/member/personal/personal_page.dart';
//import 'package:fast_ai/pages/member/personal/views/personal_common.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  /// 从顶部主播头像跳进
  final String anchorId;

  /// 从聊天列表中跳近
  final String playerId;

  const UserCard({Key key, this.playerId, this.anchorId}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  UserCardModel model = UserCardModel();
  PlayInfo playInfo;
  bool loading = false;
  bool isSelf = false;

  final TextStyle textStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark70,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    fontFamily: config.skin.fontFimaly.pingFang,
  );

  bool get anchorMatch => isNotEmpty(model.anchorId) && model.matchFlag == true;

  String get followId => isNotEmpty(model.anchorId) ? model.anchorId : model.playerId;

  @override
  void initState() {
    isSelf = config.userInfo.playerId == widget?.playerId;
    model.playerId = widget.playerId;
    model.anchorId = widget.anchorId;
    queryFollowData();
    super.initState();
  }

  Future queryFollow({bool canFollow}) async {
    print('00-queryFollow--canFollow=$canFollow, anchorId=${model.anchorId}, playerId=${model.playerId}, followId=$followId');
    Map<String, dynamic> param = {
      'playerId': followId,
      'followType': isNotEmpty(model.anchorId) ? 2 : 1, // 关注类型-1.大神 2.主播
      'follow': canFollow ? 1 : 2, //关注/取消关注	-1.关注 2.取消关注
    };
    if (canFollow && isNotEmpty(model.anchorId) && isNotEmpty('${config.userInfo.detailSet.detailParams.gidm}')) {
      try {
        param['gidm'] = '${config.userInfo.detailSet.detailParams.gidm}';
        param['anchorId'] = model.anchorId;
      } catch (e) {}
    }

    var resp = await Net.setPlayerFollow(param);
    print('11-queryFollow--canFollow=$canFollow, isSuccess=${resp.isSuccess}');
    loading = false;
    if (resp.isSuccess) {
      print('22-queryFollow=${config.userInfo.account.data.followPlayerIds.toString()}');
      if (canFollow) {
        config.userInfo.followAnchor(followId);
      } else {
        config.userInfo.unfollowAnchor(followId);
      }
      print('33-queryFollow=${config.userInfo.account.data.followPlayerIds.toString()}');
      if (mounted) setState(() {});
      Event.eventBus.fire(UserCardFollowStatusChangedEvent());
    }
    //Fluttertoast.showToast(msg: resp.isSuccess ? '关注成功' : resp.msg);
  }

  Future queryFollowData() async {
    String playerId;
    if (widget.anchorId != null) {
      print('terry 1111');
      var resp = await AnchorDynamicListReqProtocol(anchorId: widget.anchorId).request();
      if (resp.isSuccess) {
        playerId = resp.playerId;
        print('terry 3333');

        model = UserCardModel();
        model.playerId = resp.playerId;

        // 没有playerId不需要请求用户信息
        if (isEmpty(playerId) && isEmpty(widget?.playerId)) {
          print('terry 4444');
          model.level = null;
          model.name = resp.name;
          model.nickname = resp.nickname;
          model.mobileCover = resp.mobileCover;
          model.introduce = resp.introduce;
          model.fans = resp.fans;
          model.followNum = 0;
          model.leagueStatistics = [];
          model.titles = {};
          model.anchorId = resp.anchorId;
          if (mounted) setState(() {});
          return;
        }
      } else {
        Future.delayed(Duration(milliseconds: 500), () {
          AiRouter.pop(context);
        });
      }
    } else {}
    print('terry 2222');

    print('terry 00-queryUserCardInfo-playerId=${widget?.playerId} playerId=$playerId, widget.anchorId=${widget.anchorId}');
    UserCardProtocol req = UserCardProtocol(widget?.playerId ?? playerId);
    UserCardRespProtocol resp = await req.request();
    model = resp.model;

    try {
      print('terry 3333');
      playInfo = await Net.mobilePlayerInfo(widget?.playerId ?? playerId);
    } catch (e) {
      print(e);
    }
    print('terry 4444');
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('00-build-model.introduce=${model.introduce}');
    double screenW = MediaQuery.of(context).size.width;
    List<Widget> widgets = [];
    widgets.add(reportWidget());
    widgets.add(h(50));
    if (playInfo?.data?.privacy != 1) {
      widgets.add(rankWidget());
      widgets.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          isNotEmpty(model.introduce.trim()) ? model.introduce : config.baseLang['models']['noIntroduce'],
          style: textStyle.copyWith(
            fontSize: config.skin.fontSize.h4,
            height: 1.5,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ));
      widgets.add(h(18));
      // 粉丝 关注
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          fansFollowWidget(true, model.fans ?? 0),
          LineHelper.buildVLine(height: 36, paddingLeft: 50, paddingRight: 50),
          fansFollowWidget(false, model.followNum ?? 0),
        ],
      ));
      widgets.add(h(18));
      widgets.add(skilledLeagueWidget());
    } else {
      widgets.add(UserCardBodyBlank(
        subTitle: '',
      ));
    }
    // 关注 主页
    widgets.add(Container(
      height: 60,
      child: isSelf
          ? Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
//                      print('00-UserCard-homePage-自己主页, personalPageParams=${personalPageParams.toString()}');
//                      AiRouter.pop(context);
//                      showMaterialPageRoute(context, PersonalPage(params: personalPageParams),settings: RouteSettings(name: AiRouter.AiPersonalPage)).then((value){
//                        if(!config.userInfo.anchorIsLiving){
//                          Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//                        }
//                      });
                    },
                    child: Center(
                        child: Text(
                      config.baseLang[TabSdkPage.main],
                      style: textStyle.copyWith(color: config.skin.colors.fontColorDark50),
                    )),
                  ),
                )
              ],
            )
          : Row(
              children: <Widget>[
                Expanded(
                    child: InkWell(
                  onTap: () async {
                    // 关注/取关
                    bool hasFollowed = config.userInfo.hasFollowAnchor(followId);
                    print('UserCard-follow hasFollowed=$hasFollowed');
                    await queryFollow(canFollow: !hasFollowed);
                  },
                  child: Center(
                    child: !config.userInfo.hasFollowAnchor(followId)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AiSvgPicture.asset('assets/images/liveplayer/icon_fllow_add_black.svg', width: 12, height: 12),
                              Text(
                                config.baseLang['follow'],
                                style: textStyle.copyWith(color: config.skin.colors.fontColorDark),
                              )
                            ],
                          )
                        : Text(
                            config.baseLang['anchor']['followed'],
                            style: textStyle.copyWith(color: config.skin.colors.fontColorDark50),
                          ),
                  ),
                )),
                // LineHelper.buildVLine(height: 26, color: 0xFFF5F5F5),
                // Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       //关闭视频声音
// //                      Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
//                       // AiRouter.pop(context);
// //                      print('00-UserCard-homePage-他人主页, personalPageParams=${personalPageParams.toString()}');
// //                      showMaterialPageRoute(context, PersonalPage(params: personalPageParams),settings: RouteSettings(name: AiRouter.AiPersonalPage)).then((value){
// //                        if(!config.userInfo.anchorIsLiving){
// //                          config.userInfo.anchorIsLiving = true;
// //                          Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
// //                        }
// //                      });
//                     },
//                     child: Center(
//                         child: Text(
//                       config.baseLang[TabSdkPage.main],
//                       style: textStyle.copyWith(color: config.skin.colors.fontColorDark50),
//                     )),
//                   ),
// )
              ],
            ),
    ));

    return Container(
      child: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 34),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Container(
                color: Colors.white,
                width: screenW,
                child: Column(
                  children: widgets,
                ),
              ),
            ),
          ),
          Positioned(top: 0, child: anchorHeaderWidget()),
        ],
      ),
    );
  }

  Map<String, dynamic> get personalPageParams => isNotEmpty(model.anchorId)
      ? {
          'fromPage': 'detailPage',
          "anchorId": model.anchorId,
          "anchorIcon": model.mobileCover,
          "playerId": model?.playerId ?? '',
          "playerName": model.name
        }
      : {'fromPage': 'detailPage', "anchorIcon": model.mobileCover, "playerId": model?.playerId ?? '', "playerName": model.name};

  /// 擅长的联赛
  Widget skilledLeagueWidget() {
    return (model?.leagueStatistics?.length ?? 0) == 0
        ? Container()
        : Container(
            // 擅长赛事
            height: 34,
            color: Color(0xFFF7F7F7),
            child: Row(
              children: <Widget>[
                w(12),
                Text(
                  '${config.baseLang['member']['anchor']['expertMatch']}：',
                  style: textStyle,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: model.leagueStatistics
                          .map((league) => Container(
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFFE0000)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    ' ${league.leagueNameAbbr ?? league.leagueName ?? ''} ${(league.winRatio * 100).toStringAsFixed(0)}% ',
                                    style: textStyle.copyWith(color: Color(0xFFFE0000)),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  /// 段位(天梯/综合等)排名
  Widget rankWidget() {
    print('rankWidget-model?.titles=${model?.titles?.toString()}');
    return (model?.titles?.length ?? 0) == 0
        ? Container()
        : Container(
            margin: EdgeInsets.only(bottom: 18),
            child: Center(
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: model.titles.keys
                    .map((key) => Container(
                          decoration: BoxDecoration(
                            color: Color(int.parse(key) < 3 ? 0xFFFBF1F1 : 0xFFE4E8F6),
                            //border: Border.all(color: Color(0xFFFE0000)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            child: Text(
                              ' ${model.titles[key]} ',
                              style: textStyle.copyWith(color: Color(int.parse(key) < 3 ? 0xFFFE0000 : 0xFF4E77FF)),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
  }

  /// 粉丝数+粉丝文本/关注数+关注文本
  Widget fansFollowWidget(bool isFans, int count) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            count > 10000 ? '${(count / 10000).toStringAsFixed(2)}w' : '$count',
            style: textStyle.copyWith(fontSize: config.skin.fontSize.h2_1, fontFamily: config.skin.fontFimaly.dINCondensed),
          ),
          Text(
            isFans ? config.baseLang['fans'] : config.baseLang['follow'],
            style: textStyle.copyWith(fontSize: config.skin.fontSize.h6),
          ),
        ],
      ),
    );
  }

  Widget reportWidget() {
    return isNotEmpty(model.anchorId) || isSelf
        ? Container(
            height: 24,
          )
        : InkWell(
            onTap: () {
              print('00-UserCard-reportWidget');
              AiRouter.pop(context);

              print('11-UserCard-reportWidget');
              showPopup(context, UserReport());
            },
            child: Container(
              margin: EdgeInsets.only(left: 12, top: 12),
              child: Row(
                children: <Widget>[
                  AiSvgPicture.asset('assets/images/detail/icon_detail_usercard_report.svg', width: 12, height: 12),
                  w(4),
                  Text(
                    config.baseLang['report'],
                    style: textStyle,
                  )
                ],
              ),
            ),
          );
  }

  /// 主播头像+昵称+段位
  Widget anchorHeaderWidget([double size = 68.0]) {
    print('model.levelRank=${model.levelRank}');
    final isCurrentAnchor = isNotEmpty(model.anchorId) && model?.anchorId == config?.userInfo?.detailSet?.detailParams?.anchorId;

    return GestureDetector(
      onTap: () {
//        print('00-UserCard-anchorHeaderWidget-自己主页, personalPageParams=${personalPageParams.toString()}');
//        //关闭视频声音
////        Event.eventBus.fire(DetailVideoEvent(state: 'stop'));
//        AiRouter.pop(context);
//        showMaterialPageRoute(context, PersonalPage(params: personalPageParams),settings: RouteSettings(name: AiRouter.AiPersonalPage)).then((value){
//          if(!config.userInfo.anchorIsLiving){
//            config.userInfo.anchorIsLiving = true;
//            Event.eventBus.fire(DetailVideoEvent(state: 'playing'));
//          }
//        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
                // 外圆
                borderRadius: BorderRadius.circular(size / 2),
                border: Border.all(color: Colors.white, width: 3, style: BorderStyle.solid)),
            child: ClipRRect(
              // 头像内圆
              borderRadius: BorderRadius.circular((size - 6) / 2),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  SizedBox(
                    width: size - 6,
                    height: size - 6,
                    child: AiImage.fromUrlHasSize(model.mobileCover, 'assets/images/member/img_profile_picture_loading.png', fit: BoxFit.cover),
                  ),
                  isCurrentAnchor
                      ? Positioned(
                          top: 46,
                          child: Container(
                            height: 18,
                            width: size - 6,
                            color: Color(0xFFFD4C74),
                            child: Center(
                                child: Text(
                              config.baseLang['member']['userList']['anchor'],
                              style: textStyle.copyWith(color: Colors.white),
                            )),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          h(10),
          Row(
            //昵称+段位
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(isEmpty(model.name) ? model.nickname : model.name,
                  style: textStyle.copyWith(color: Colors.black, fontSize: config.skin.fontSize.h2_1)),
              model?.level == null
                  ? Container()
                  : AiImage.asset(LevelIcons[(model.level >= 0 && model.level <= 7) ? model.level : 0], width: 22, height: 22),
            ],
          ),
        ],
      ),
    );
  }
}
