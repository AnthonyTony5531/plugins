

import 'package:flutter/material.dart';

// 测试，先不删
class ChatRoomGestureWidget extends StatefulWidget {

  final Widget body;

  ChatRoomGestureWidget({this.body});

  @override
  _ChatRoomGestureWidgetState createState() => _ChatRoomGestureWidgetState();

}


class _ChatRoomGestureWidgetState extends State<ChatRoomGestureWidget> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (event){},
      onVerticalDragUpdate: (event){
        print('onVerticalDragUpdate ========================> ${event.localPosition.dy}');
      },
      onVerticalDragDown: (event){},
      onVerticalDragEnd: (event){},
      onVerticalDragCancel: (){},
      child: widget.body ?? SizedBox.shrink(),
    );
  }

}