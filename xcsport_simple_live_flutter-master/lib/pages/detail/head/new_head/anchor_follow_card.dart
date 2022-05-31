import 'package:fast_ai/api/protocols/anchor/anchor_dynamicList.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/hooks/hook_name.dart';
import 'package:fast_ai/hooks/hooks.dart';
import 'package:fast_ai/pages/anchor/anchor_home_model.dart';
import 'package:fast_ai/pages/detail/head/new_head/user_card_protocol.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:flutter/material.dart';

typedef OnFollowTap = Function(Map<String, dynamic>, String);

Map get LevelIcons {
  return {
    0: 'assets/images/member/personal/icon_rank_8_normal.png',
    1: 'assets/images/member/personal/icon_rank_7_normal.png',
    2: 'assets/images/member/personal/icon_rank_6_normal.png',
    3: 'assets/images/member/personal/icon_rank_5_normal.png',
    4: 'assets/images/member/personal/icon_rank_4_normal.png',
    5: 'assets/images/member/personal/icon_rank_3_normal.png',
    6: 'assets/images/member/personal/icon_rank_2_normal.png',
    7: 'assets/images/member/personal/icon_rank_1_normal.png',
  };
}

class AnchorFollowCard extends StatefulWidget {
  final String anchorId;
  final String anchorUrl;
  final String anchorName;
  final VoidCallback onFollowed;
  final OnFollowTap onFollowTap;
  final String gidm;

  const AnchorFollowCard({
    Key key,
    @required this.anchorId,
    this.anchorUrl,
    this.anchorName,
    this.onFollowed,
    this.gidm,
    this.onFollowTap,
  }) : super(key: key);

  @override
  _AnchorFollowCardState createState() => _AnchorFollowCardState();
}

class _AnchorFollowCardState extends State<AnchorFollowCard> {
  final TextStyle textStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    fontFamily: config.skin.fontFimaly.pingFang,
  );

  AnchorHomeModel anchorHomeModel;
  UserCardModel model = UserCardModel();
  bool loading = false;
  var baseLang = config.langMap['baseLang'];

  Future queryAnchorInfo() async {
    print(
        'AnchorFollowCard-anchorId=${widget.anchorId}, anchorUrl=${widget.anchorUrl}, anchorName=${widget.anchorName}');

    anchorHomeModel =
        await AnchorDynamicListReqProtocol(anchorId: widget.anchorId).request();
    print('00-queryAnchorInfo-anchorId=${widget.anchorId}');
    if (anchorHomeModel.isSuccess) {
      print(
          '11-queryAnchorInfo, name=${anchorHomeModel.name}, nickname=${anchorHomeModel.nickname}, anchorId=${anchorHomeModel.anchorId} playerId=${anchorHomeModel.playerId}');

      // 未绑定商户的主播没有playerId
      if (isEmpty(anchorHomeModel.playerId)) return;

      UserCardRespProtocol resp =
          await UserCardProtocol(anchorHomeModel.playerId).request();
      model = resp.model;
      print(
          '00-UserCardProtocol, nickname=${model.nickname}, anchorId=${model.anchorId} playerId=${model.playerId}');
      if (resp.isSuccess) {
        print('22-queryAnchorInfo');
        if (mounted) setState(() {});
      }
//      else {
//        print('33-queryAnchorInfo');
//        AiRouter.pop(context);
//      }
    }
//    else {
//      print('44-queryAnchorInfo');
//      AiRouter.pop(context);
//    }
  }

  @override
  void initState() {
    queryAnchorInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.only(top: 16, left: 12, right: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _configLeftWidget(),
          ),
          _configRightWidget(),
        ],
      ),
    );
  }

  Widget _configLeftWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _configIconWidget(),
        Expanded(child: _configDescribeWidget()),
      ],
    );
  }

  Widget _configDescribeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: _configGradeWidget(),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          baseLang['square']['askForAttention'],
          maxLines: 3,
          style: textStyle.copyWith(fontSize: config.skin.fontSize.h5),
        ),
      ],
    );
  }

  Widget _configGradeWidget() {
    return Row(
        //昵称+段位
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            maxLengthString(
                isNotEmpty(widget.anchorName)
                    ? widget.anchorName
                    : model.name ?? model.nickname ?? '',
                8),
            style: textStyle.copyWith(fontSize: config.skin.fontSize.h3),
          ),
          SizedBox(width: 4.0),
          AiImage.asset(
              LevelIcons[
                  (model.level >= 0 && model.level <= 7) ? model.level : 0],
              width: 22.0,
              height: 22.0),
        ]);
  }

  Widget _configIconWidget() {
    return Container(
      width: 62,
      height: 62,
      margin: EdgeInsets.only(right: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(31),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Positioned(
              width: 62.0,
              height: 62.0,
              child: AiImage.fromUrl(
                isNotEmpty(widget.anchorUrl)
                    ? widget.anchorUrl
                    : model.mobileCover ?? '',
                "assets/images/default/default_anchor.png",
                  BoxFit.cover),
            ),
            Positioned(
              top: 46,
              child: Container(
                height: 18,
                width: 62,
                color: Color(0xFFFD4C74),
                child: Center(
                  child: Text(
                    baseLang['member']['userList']['anchor'],
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _configRightWidget() {
    return Container(
      width: 90,
      margin: EdgeInsets.only(top: 12),
      child: GestureDetector(
        onTap: () {
          //if(isEmpty(model.playerId)) return;
          if (Hooks.ins.isBlocked(HookName.AboutAnchor, {})) return;

          // followType   关注类型-1.大神 2.主播
          // followType   关注/取消关注	-1.关注 2.取消关注
          final data = {
            'playerId': widget.anchorId,
            'followType': 2,
            'follow': 1,
            'anchorId': widget.anchorId,
            'gidm': widget.gidm,
          };
          widget.onFollowTap?.call(data, widget.anchorId);
          AiRouter.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment(0, 0),
            height: 40,
            width: 78,
            child: Text(
              baseLang['square']['attentionTitle'],
              style: textStyle.copyWith(
                  fontSize: config.skin.fontSize.h4,
                  color: config.customStyle.themeIncludeFontColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
