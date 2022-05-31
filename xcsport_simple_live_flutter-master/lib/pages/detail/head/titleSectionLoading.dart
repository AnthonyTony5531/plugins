import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/config/user_info.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//头部（自建appBar）
@immutable
class TitleSectionLoading extends StatefulWidget {
  TitleSectionLoading({Key key, this.leagueName}) : super(key: key);
  String leagueName;
  @override
  _TitleSectionLoading createState() => _TitleSectionLoading();
}

class _TitleSectionLoading extends State<TitleSectionLoading> {
  String get leagueName {
    return widget.leagueName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              AiRouter.pop(context);
            },
            child: Container(
              width: 48,
              margin: EdgeInsets.only(right: 19),
              padding: EdgeInsets.only(left: 0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.white,
                ),
                onPressed: () {
                  config.userInfo.detailSet = DetailSet();
                  AiRouter.pop(context);
                },
              ),
            ),
          ),
          centerText(),
          //fiexdIcon(),
          InkWell(
            onTap: () => {},
            child: Container(
                //color: Colors.red,
                padding: EdgeInsets.fromLTRB(2, 5, 14, 5),
                margin: EdgeInsets.only(left: 18),
                child: AiSvgPicture.asset(
                  "assets/images/detail/detail_more.svg",
                  width: 24,
                )),
          ),
        ],
      ),
    );
  }

  Widget centerText() {
    Widget content = Container();
    content = Expanded(
      child: InkWell(
        onTap: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 200),
              child: Text(
                leagueName,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AiTextStyle(fontSize: 14.0, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: config.skin.disdance.dL5),
              child: AiImage.asset(
                "assets/images/detail/detail_down_pull@2x.png",
                height: 18,
              ),
            ),
          ],
        ),
      ),
    );

    return content;
  }
}
