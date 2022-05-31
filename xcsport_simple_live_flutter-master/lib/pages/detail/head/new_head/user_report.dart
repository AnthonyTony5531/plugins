import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/router.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UserReport extends StatefulWidget {
  @override
  _UserReportState createState() => _UserReportState();
}

class _UserReportState extends State<UserReport> {
  final TextStyle grayTextStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark70,
    fontSize: config.skin.fontSize.h5,
    fontWeight: config.skin.fontWeight.regular,
    fontFamily: config.skin.fontFimaly.pingFang,
  );
  final TextStyle textStyle = AiTextStyle(
    color: config.skin.colors.fontColorDark,
    fontSize: config.skin.fontSize.h4,
    fontWeight: config.skin.fontWeight.regular,
    fontFamily: config.skin.fontFimaly.pingFang,
  );

  List<ReportTypeModel> models = [];
  String reportContent = '';
  int currentIndex = 0;
  var baseLang = config.baseLang;

  @override
  void initState() {
    List titles = [
      baseLang['reportTitle1'],
      baseLang['reportTitle2'],
      baseLang['reportTitle3'],
      baseLang['reportTitle4'],
      baseLang['reportTitle5'],
      baseLang['reportTitle6'],
      baseLang['other']
    ];
    for(int i = 0; i < titles.length; i++) {
      models.add(ReportTypeModel(index: i, title: titles[i], select: i==0));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 320,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 12, top: 18),
              child: Text(baseLang['reportType'], style: textStyle,),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.only(left: 12, right: 12),
              child: GridView.builder(
                //shrinkWrap: true,
                //padding: EdgeInsets.zero,
                itemCount: models.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: (screenW-24)/4/30,
                ),
                itemBuilder: (context, index) {
                  print('00-UserReport-index=$index');
                  return ReportTypeWidget(model: models[index], onSelected: (m){
                    if(currentIndex == index) return;

                    ReportTypeModel preModel = models[currentIndex];
                    ReportTypeModel curModel = models[index];
                    preModel.select = false;
                    curModel.select = true;
                    currentIndex = index;
                    if(mounted) setState(() {});
                    print('index=$index, title=${m.title} currentIndex=$currentIndex');
                  },);
                }
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(baseLang['reportReason'], style: textStyle,),
                  Text('(${baseLang['option']})', style: grayTextStyle,),
                ],
              )
            ),
            textViewWidget(reportContent),
            reportButton(),
          ],
        ),
      ),
    );
  }

  // 文本输入框
  Widget textViewWidget(String contentText) {
    int textLength = contentText.length;
    return Container(
//      color: Colors.orange,
      margin: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        //border: Border.all(color: Color(0xFFFE0000)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 95,
            margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: TextField(
              maxLines: 50,
              keyboardType:TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: baseLang['reportMore'],
                hintStyle: grayTextStyle,
                border: InputBorder.none,
              ),
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(200)
              ],
              onChanged: (text){
                reportContent = text;
                if(mounted) setState(() {});
              },
              onSubmitted: (text) {
                reportContent = text;
              },
              style: textStyle.copyWith(fontSize: config.skin.fontSize.h5),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              child: Text('$textLength/200', style: grayTextStyle,),
            )
          ),
        ],
      ),
    );
  }

  Widget reportButton() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 25),
      child: GestureDetector(
        onTap: () {
          print('提交意见');
          Fluttertoast.showToast(msg: baseLang['reportSuccess']);
          AiRouter.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment(0, 0),
            height: 40,
            child: Text(config.baseLang['report'], style: textStyle, textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}





class ReportTypeModel {
  String title;
  bool select;
  int index;
  ReportTypeModel({this.title, this.select, this.index});
}

class ReportTypeWidget extends StatelessWidget {
  final ReportTypeModel model;
  final ValueChanged<ReportTypeModel> onSelected;
  ReportTypeWidget({Key key, this.model, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 4),
              child: AiSvgPicture.asset('assets/images/member/${model.select ? 'suggest_form_radio_selected.svg' : 'suggest_form_radio_normal.svg'}', width: 14,),
            ),
            Text(
              '${model.title}',
              style: AiTextStyle(
                color: config.skin.colors.fontColorDark70,
                fontSize: config.skin.fontSize.h5,
                fontWeight: config.skin.fontWeight.regular,
                fontFamily: config.skin.fontFimaly.pingFang,
              )
            ),
          ],
        ),
        onTap: () {
          this.onSelected(model);
        },
      ),
    );
  }


}

