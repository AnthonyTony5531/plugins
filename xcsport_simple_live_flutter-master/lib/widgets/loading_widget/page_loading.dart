import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_circular.dart';

/*
*********************************************************************
 * author:Sam
 * date:2019-12-10
 **********************************************************************
 */


//页面加载
class PageLoading extends StatelessWidget {
  final int color;


  PageLoading({this.color=0x00000000});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color(color),
      child: Center(
        child: LoadingCircular(),
      ),
    );
  }
}
