import 'package:fast_ai/api/protocols/aigames/ai_game_url_protocol.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/module/common/widget/loading_dialog.dart';
import 'package:fast_ai/module/common/widget/visibility.dart';
import 'package:fast_ai/pages/new_user_course/new_user_course_page.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/show_toast/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCommonPage extends StatefulWidget {

  String supplierId;
  String gameKey;
  String roomNo;
  String anchorId;
  String title;
  GameCommonPage({
    Key key,
    @required this.supplierId,
    @required this.gameKey,
    this.roomNo,
    this.anchorId}): super(key: key);

  @override
  _GameCommonPageState createState() => _GameCommonPageState();
}

class _GameCommonPageState extends State<GameCommonPage> {

  String gameUrl;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Show(
            isShow: !isStrNullOrEmpty(gameUrl) ,
            child: NewUserCoursePage(
              isShowGameBgColor: true,
              isJointLang: false,
              url: gameUrl,
              usesGameWeb: true,
              title: widget.title ?? '游戏',
            ),
          ),
        )
    );
  }


  void loadData() async{
    final loading = LoadingDialog.create('${config.langMap['baseLang']['virtual']['loadingContent']}...');
    loading.show(context);
    var result = await GameURlNewReqProtocol(supplierId: widget.supplierId, gameKey: widget.gameKey).request();
    loading.dismiss();
    await sleep(500);
    String url = result.url;
    if(result.isError){
      showToas("${config.langMap['baseLang']['networkError']['networkErrorRetry4']}");
      return;
    }
    // 统计用
    gameUrl = '$url&roomNo=${widget.roomNo}&anchorId=${widget.anchorId}';
    if(mounted)setState(() {});
  }
}
