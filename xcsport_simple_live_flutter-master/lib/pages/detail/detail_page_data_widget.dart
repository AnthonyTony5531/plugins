import 'package:flutter/cupertino.dart';
import 'package:fast_ai/pages/detail/data/data_detail_page.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-11-28
 **********************************************************************
 */

//详情页数据页面

class DetailPageDataWidget extends StatefulWidget {
  final String homeId;
  final String awayId;
  final String gidm;
  final bool dataWebLoading;

  DetailPageDataWidget(Key key, {this.homeId, this.awayId, this.gidm, this.dataWebLoading}) : super(key: key);

  @override
  DetailPageDataWidgetState createState() => DetailPageDataWidgetState();
}

class DetailPageDataWidgetState extends State<DetailPageDataWidget> {
  bool dataWebLoading;

  @override
  void initState() {
    dataWebLoading = widget.dataWebLoading;
    super.initState();
  }

  Widget dataDetailPage;

  @override
  Widget build(BuildContext context) {
    dataDetailPage = DataDetailPage.create(
        gidm: widget.gidm,
        homeId: widget.homeId,
        awayId: widget.awayId,
        hasActionBar: false,
        onPageFinished: (url) {
          setState(() {
            dataWebLoading = false;
          });
        });
    // return ListView(
    //   controller: ScrollController(),
    //   children: <Widget>[
    //     Container(
    //       height: 10,
    //     ),
    //     Expanded(
    //       flex: 1,
    //       child: dataDetailPage,
    //     )
    //   ],
    // );
    return Container(height: 4000, margin: EdgeInsets.only(top: 1), child: dataDetailPage);

    // return Container(
    //   height: 4000,
    //   margin: EdgeInsets.only(top: 1),
    //   child: Stack(
    //     children: <Widget>[
    //       DataDetailPage.create(
    //           gidm: widget.gidm,
    //           homeId: widget.homeId,
    //           awayId: widget.awayId,
    //           hasActionBar: false,
    //           onPageFinished: (url) {
    //             setState(() {
    //               dataWebLoading = false;
    //             });
    //           }),
    //       dataWebLoading
    //           ? MatchLoading(
    //               count: 4,
    //             )
    //           : Container(),
    //     ],
    //   ),
    // );
  }
}
