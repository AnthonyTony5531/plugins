import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MemberBettingLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Container(
             margin: EdgeInsets.all(16.0),
             width: 29.0,
             height: 13.0,
             color: theme.backgroundColor,
           ),
            // AiSvgPicture.asset(
            //     'assets/images/img_empty_ld_normal.svg'
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    color: theme.backgroundColor,
                    width: 148.0,
                    height: 13.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    color: theme.backgroundColor,
                    width: 182.0,
                    height: 13.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    color: theme.backgroundColor,
                    width: 182.0,
                    height: 13.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 45.0, right: 20.0),
                          color: theme.backgroundColor,
                          height: 13.0,
                        ),
                      ),
                      
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 45.0 , right: 20.0),
                          color: theme.backgroundColor,
                          height: 13.0,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 45.0, right: 20.0),
                          color: theme.backgroundColor,
                          height: 13.0,
                          
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 49.0 ,bottom: 10.0, right: 20.0),
                          color: theme.backgroundColor,
                          height: 13.0,
                        ),
                      ),
                      
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 49.0 ,bottom: 10.0, right: 20.0),
                          height: 13.0,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 49.0 ,bottom: 10.0, right: 20.0),
                          color: theme.backgroundColor,
                          height: 13.0,
                          
                        ),
                      ),
                    ],
                  )
                  
                ],
              ),
            )
          ],
        )
      )
    );
  }
  
}