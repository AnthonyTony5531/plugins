import 'dart:math';
import 'package:flutter/material.dart';

///
///   聊天室未读消息数量冒泡裁剪路线
///
class ChatRoomMsgCountBgClipPath extends CustomClipper<Path> {

  int count;

  ChatRoomMsgCountBgClipPath({@required this.count});

  double r = 4.0;

  @override
  Path getClip(Size size) {
    var path = Path();
    path..moveTo(0, 0 - r)
      ..arcTo(Rect.fromLTRB(0, 0, r, r), -pi, pi/2,false)
      ..lineTo(r, 0)
      ..lineTo(size.width - r, 0)
      ..arcTo(Rect.fromLTRB(size.width - r, 0, size.width, r), pi * 3/2, pi/2,false)
      ..lineTo(size.width, r)
      ..lineTo(size.width, size.height * 3/4-r)
      ..arcTo(Rect.fromLTRB(size.width - r, size.height * 3/4 - r, size.width, size.height * 3/4), 0, pi/2,false)
      ..lineTo(size.width - r, size.height * 3/4)
      ..lineTo(size.width/5, size.height * 3/4)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)..close();
    return path;
  }

  @override
  bool shouldReclip(ChatRoomMsgCountBgClipPath oldClipper) {
    return oldClipper.count != this.count;
  }



}
