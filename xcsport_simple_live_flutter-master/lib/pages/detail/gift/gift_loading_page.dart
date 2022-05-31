import 'package:fast_ai/utils/ai_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GiftLoadingPage extends StatefulWidget {

  GiftLoadingPage({Key key}): super(key: key);

  @override
  _GiftLoadingPageState createState() => _GiftLoadingPageState();
}

class _GiftLoadingPageState extends State<GiftLoadingPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double itemWidth = MediaQuery.of(context).size.width / 4.0;
    double itemHeight = 88.0;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 185.0,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext ctx, int index){
            return Container(
              alignment: Alignment.center,
              child: AiImage.asset('assets/images/gift/empty_detail_gift.png',width: 25,height: 25),
            );
          }
      ),
    );
  }
}
