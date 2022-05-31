import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarLevelWidget extends StatefulWidget {
  final double score;
  final int startCount;

  final StarStyle style;

  StarLevelWidget({
    Key key,
    this.score,
    this.startCount = 5,
    this.style,
  }) : super(key: key);

  @override
  _StarLevelWidgetState createState() => _StarLevelWidgetState();
}

class _StarLevelWidgetState extends State<StarLevelWidget> {

  String fullStart;
  String halfStart;
  String normalStart;


  @override
  void initState() {
    if(widget.style == StarStyle.light){
      fullStart = StarLight.fullStart;
      halfStart = StarLight.halfStart;
      normalStart = StarLight.normalStart;
    } else if(widget.style == StarStyle.grey){
      fullStart = StarGrey.fullStart;
      halfStart = StarGrey.halfStart;
      normalStart = StarGrey.normalStart;
    } else {
      fullStart = StarDart.fullStart;
      halfStart = StarDart.halfStart;
      normalStart = StarDart.normalStart;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> starts = List.generate(5, (index) {
      return _getStarImage(score: widget.score, position: index);
    }).toList();
    return Container(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: starts,
      ),
    );
  }

  Widget _getStarImage({double score, int position}) {
    if (score > widget.startCount) {
      score = widget.startCount.toDouble();
    }
    if (score.floor() >= position + 1) {
      return _getStart(fullStart);
    } else if ((score - position) > 0 && (score - position) % 1 < 1) {
      return Stack(
        children: <Widget>[
          _getStart(normalStart),
          _getStart(halfStart),
        ],
      );
    } else {
      return _getStart(normalStart);
    }
  }

  Widget _getStart(String path){
    if(path.endsWith(".svg")){
      return AiSvgPicture.asset(
        path,
        width: 12,
        height: 12,
      );
    } else {
      return AiImage.asset(
        path,
        width: 12,
        height: 12,
      );
    }
  }
}

enum StarStyle{
  light, dart, grey
}

class StarLight{
  static const String fullStart = "assets/images/member/drawer/icon_constellation_star_all.png";
  static const String halfStart  = "assets/images/member/drawer/icon_constellation_star_half.png";
  static const String normalStart = "assets/images/member/drawer/icon_constellation_star_normal.png";
}

class StarDart{
  static const String fullStart = "assets/images/member/constellation/icon_constellation_star_all.svg";
  static const String halfStart  = "assets/images/member/constellation/icon_constellation_star_half.svg";
  static const String normalStart = "assets/images/member/constellation/icon_constellation_star_normal.svg";
}

class StarGrey{
  static const String fullStart = "assets/images/member/constellation/icon_constellation_star_all.svg";
  static const String halfStart  = "assets/images/member/constellation/icon_constellation_star_half.svg";
  static const String normalStart = "assets/images/attention/icon_follow_star_normal.svg";
}
