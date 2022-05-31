import "package:fast_ai/utils/ai_image.dart";
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_appbar.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DataViewPage extends StatefulWidget {
  final dynamic params;

  DataViewPage({Key key, this.params}) : super(key: key);
  @override
  _DataViewPageState createState() => _DataViewPageState();
}

class _DataViewPageState extends State<DataViewPage> {
  MatchesDetailModel matchesDetailModel;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic params = ModalRoute.of(context).settings.arguments;
    matchesDetailModel = params['match'];
    String homeTeam =string( matchesDetailModel.data.homeTeamAbbr, defaultVal:  matchesDetailModel.data.homeTeam);
    String awayTeam = string( matchesDetailModel.data.awayTeamAbbr, defaultVal:  matchesDetailModel.data.awayTeam);
    String gidm = matchesDetailModel.data.gidm;
    String homeId = matchesDetailModel.data.homeId;
    String awayId = matchesDetailModel.data.awayId;
    String url = '${Api.baseMainUrl}/dataview?gidm=$gidm&theme=3&homeId=$homeId&awayId=$awayId&head=0&background=0&lang=${Translations.langCode}';

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: Theme.of(context).buttonColor,
          appBar: AiAppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () => AiRouter.pop(context)),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(homeTeam + ' vs ' + awayTeam, style: AiTextStyle(color: Colors.black, fontSize: 15)),
          ),
          body: Container(
            child: TabBarView(
              children: <Widget>[
                WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ],
            ),
          ),
        ));
  }
}
