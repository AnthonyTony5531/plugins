import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/loading_widget/ai_flashing_loading.dart';
import 'package:flutter/material.dart';

class BrokeLoading extends StatelessWidget {

  final bool isList;
  BrokeLoading({this.isList = false});

  @override
  Widget build(BuildContext context) {

    var body = Container(
      color: config.skin.list.backgroundColor,
      child: isList ? _configListView() : Column(
        children: [
          _configFirstWidget(),
          Expanded(child: _configListView())
        ],
      ),
    );

    return AiFlashingLoading(
      child: body,
    );
  }

  Widget _configListView(){
    return ListView.builder(
      padding: EdgeInsets.only(top: 0.0),
      itemBuilder: (con, index) {
        return _itemView();
      },
      itemCount: 10,
    );
  }

  Widget _configFirstWidget() {
    Color whiteColor = Color(0xFFFFFFFF);
    var rowWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        SizedBox(
          width: 24.0,
        ),
        Container(
          width: 60.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ],
    );
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          rowWidget,
          Container(
            width: 60.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ],
      ),
    );
  }
}

class _itemView extends StatelessWidget {
  Color backColor = Color(0xFFF8F8F7);
  Color whiteColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return _configItemWidget();
  }

  Widget _configItemWidget() {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0,bottom: 8.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          _configFirstWidget(),
          SizedBox(height: 12.0,),
          _configSecondWidget(),
          SizedBox(height: 8.0,),
          _configThirdWidget(),
        ],
      ),
    );
  }

  Widget _configFirstWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _configFirstLeftWidget(),
        _configFirstRightWidget(),
      ],
    );
  }

  Widget _configSecondWidget() {
    return Container(
      height: 56.0,
      padding: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          _configSecondLeftWidget(),
          SizedBox(
            width: 22.0,
          ),
          _configSecondModdleWidget(),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _configThirdWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 62.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: 62.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ],
    );
  }

  Widget _configSecondModdleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 8.0,),
        Row(
          children: [
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Container(
              width: 157.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 4.0,
        ),
        Row(
          children: [
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Container(
              width: 157.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0,),
      ],
    );
  }

  Widget _configSecondLeftWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 8.0,),
        Container(
          width: 30.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: 30.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: 30.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        SizedBox(height: 8.0,),
      ],
    );
  }

  Widget _configFirstRightWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        SizedBox(
          height: 2.0,
        ),
        Container(
          width: 62.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ],
    );
  }

  Widget _configFirstLeftWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Color(0xFFF2F2F2),
              width: 1.0,
            ),
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Container(
                  width: 44.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
