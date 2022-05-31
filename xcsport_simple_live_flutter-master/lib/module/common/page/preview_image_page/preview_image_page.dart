import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'dart:io';

class PreviewImagePage extends StatefulWidget {
  final String img;
  final List<String> album;
  final double width;
  final bool isFile;

  PreviewImagePage({
    Key key,
    @required this.img,
    @required this.album,
    @required this.width,
    this.isFile = false,
  }) : super(key: key);

  @override
  _PreviewImageState createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImagePage> {
  int get albumSize => widget.album?.length ?? 0;

  double get screenWidth => widget.width ?? 0;

  String image;
  int index = 1;
  ScrollController _scrollController;
  double downX = 0.0; //触开始的时候的left
  bool half = false; //是否超过一半

  @override
  void initState() {
    super.initState();
    final initIndex =
        widget.album.indexWhere((element) => element == widget.img) + 1;
    print('initIndex = $initIndex');
    if (initIndex > 1) {
      print('screenWidth => $screenWidth');
      _scrollController =
          ScrollController(initialScrollOffset: screenWidth * (initIndex - 1));
    } else {
      _scrollController = ScrollController(initialScrollOffset: 0);
    }
    image = widget.img;
    index = initIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: widget.album
                    .map((path) => _buildImgItemView(context, path))
                    .toList(),
              ),
            ),
            Positioned(
              top: 64.0,
              child: Container(
                alignment: Alignment.center,
                width: screenWidth,
                child: Text(
                  '$index/$albumSize',
                  style: cmPackage.res.textCreator.style(
                    color: Colors.white,
                    fontSize: 16.0,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(1, 1)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImgItemView(BuildContext context, String imgUrl) {
    return Listener(
      onPointerMove: (PointerMoveEvent event) => imgMove(event, screenWidth),
      onPointerDown: (PointerDownEvent event) => downX = event.position.dx,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        onHorizontalDragEnd: (DragEndDetails details) =>
            moveEnd(details, screenWidth),
        child: SizedBox(
          width: screenWidth,
          child: widget.isFile
              ? cmPackageImageCreator.fromFile(File(imgUrl))
              : cmPackageImageCreator.fromUrl(
                  imgUrl), //i['url'] != null ? Image.network(i['url']) : Image.file(i['file']),
        ),
      ),
    );
  }

  void imgMove(PointerMoveEvent event, double width) {
    //down 为起点
    var left = event.position.dx;
    var now = (index - 1) * width;
    var move = left - downX; //移动距离
    if (left - downX > width / 2 || downX - left > width / 2) {
      half = true;
    } else {
      half = false;
    }
    _scrollController.jumpTo(now - move);
  }

  void moveEnd(DragEndDetails details, double width) {
    var end = details.primaryVelocity;
    if (end > 10 && index > 1) {
      lastPage(width);
    } else if (end < -10 && index < albumSize) {
      nextPage(width);
    } else if (half == true) {
      if (downX > width / 2 && index < albumSize) {
        //右边开始滑动超过一半,则下一张
        nextPage(width);
      } else if (downX < width / 2 && index > 1) {
        lastPage(width);
      } else {
        _scrollController.animateTo(
          (index - 1) * width,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      }
    } else {
      _scrollController.animateTo(
        (index - 1) * width,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  void nextPage(double width) {
    setState(() {
      index = index + 1;
      _scrollController.animateTo(
        (index - 1) * width,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  void lastPage(double width) {
    setState(() {
      index = index - 1;
      _scrollController.animateTo(
        (index - 1) * width,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  void last() {
    if (1 == index) {
    } else {
      setState(() {
        image = widget.album[index - 2];
        index = index - 1;
      });
    }
  }

  void next() {
    if (widget.album.length == index) {
    } else {
      setState(() {
        image = widget.album[index];
        index = index + 1;
      });
    }
  }
}
