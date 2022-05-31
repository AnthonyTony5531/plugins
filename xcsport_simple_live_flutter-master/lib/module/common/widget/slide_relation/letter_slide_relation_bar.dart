import 'dart:async';

import 'package:flutter/material.dart';

final _defLetters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class LetterSlideRelationBar extends StatefulWidget {
  final double size;
  final List<String> letters;
  final double padding;
  final TextStyle textStyle;
  final TextStyle selTextStyle;
  final Color selectBg;
  final Color backgroundColor;
  final ValueChanged<String> onTouchValueCallBack;
  final VoidCallback onHideCallBack;

  LetterSlideRelationBar({
    Key key,
    this.letters,
    this.onTouchValueCallBack,
    this.onHideCallBack,
    this.textStyle,
    this.selTextStyle,
    this.selectBg,
    this.backgroundColor,
    padding,
    size,
    height,
  })  : size = size ?? 20.0,
        padding = padding ?? 0.0,
        super(key: key);

  @override
  _LetterSlideRelationBarState createState() => _LetterSlideRelationBarState();
}

class _LetterSlideRelationBarState extends State<LetterSlideRelationBar> {
  final GlobalKey _columnKey = GlobalKey();

  List<String> _letter = [];
  double _topY = 0;
  double _bottomY = 0;

  // 当前值
  String _curValue = "";

  // 当前位置
  num _index = 0;
  num _beforeIndex;
  bool _isShowSelect = false;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _letter.clear();
    if (widget.letters != null && widget.letters.length != 0) {
      _letter.addAll(widget.letters);
    } else {
      _letter.addAll(_defLetters);
    }
  }

  @override
  void dispose() {
    _cancelDownTime();
    super.dispose();
  }

  @override
  void didUpdateWidget(LetterSlideRelationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 数据更新，重新计算高度
    if (oldWidget.letters != widget.letters) {
      _letter.clear();
      if (widget.letters != null && widget.letters.length != 0) {
        _letter.addAll(widget.letters);
      } else {
        _letter.addAll(_defLetters);
      }
      _curValue = '';
      _index = 0;
      _isShowSelect = false;

      _updateState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final contentWidth = widget.size + widget.padding * 2;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: widget.padding),
                  alignment: Alignment.center,
                  width: contentWidth,
                  height: _letter.length * widget.size,
                  color: widget.backgroundColor ?? Colors.white,
                  child: Column(
                    key: _columnKey,
                    mainAxisSize: MainAxisSize.min,
                    children: _letter.map((value) {
                      return _SlideItem(
                        itemWidth: widget.size,
                        itemHeight: widget.size,
                        value: value,
                        isSelect: _letter.indexOf(value) == _index && _isShowSelect,
                        textStyle: widget.textStyle,
                        selTextStyle: widget.selTextStyle,
                      );
                    }).toList(),
                  ),
                ),
                onTapDown: (tapEvent) => _updateLabel(tapEvent.localPosition),
                onTapUp: (tapEvent) {
                  _updateLabel(tapEvent.localPosition);
                  _starDownTime();
                },
                onPanDown: (event) => _updateLabel(event.localPosition),
                onPanUpdate: (event) => _updateLabel(event.localPosition),
                onPanEnd: (event) => _starDownTime(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _isShowSelect
                ? Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: Color(0xff000000).withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _curValue ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  // 计算第一个item的起点
  void _calculatedPosition() {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      RenderBox renderBox = _columnKey.currentContext.findRenderObject();
      _topY = renderBox.localToGlobal(Offset.zero).dy;
      _bottomY = _topY + (_letter.length * widget.size);
    });
  }

  // 更新
  void _updateLabel(Offset position) {
    _cancelDownTime();

    // if (_topY > position.dy) {
    //   _index = 0;
    // } else if (position.dy > _bottomY) {
    //   _index = _letter.length - 1;
    // } else {
    //   var itemY = position.dy - _topY;
    //   _index = itemY ~/ widget.size;
    // }

    // double py = position.dy - widget.size;
    double py = position.dy;
    if (py <= 0) {
      _index = 0;
    } else {
      _index = py ~/ widget.size;
    }

    // 防止下指标越位
    if (_index >= _letter.length) {
      _index = _letter.length - 1;
    }

    _curValue = _letter[_index];
    if (_index != _beforeIndex || !_isShowSelect) {
      widget.onTouchValueCallBack?.call(_curValue);
      _isShowSelect = true;
      _beforeIndex = _index;
      _updateState();
    }
  }

  void _updateState() {
    if (this.mounted) {
      super.setState(() {});
    }
  }

  void _starDownTime() {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 500), () {
      _isShowSelect = false;
      widget.onHideCallBack?.call();
      _updateState();
    });
  }

  void _cancelDownTime() {
    _timer?.cancel();
    _timer = null;
  }
}

class _SlideItem extends StatelessWidget {
  final double itemWidth;
  final double itemHeight;
  final TextStyle textStyle;
  final TextStyle selTextStyle;
  final Color selectBg;
  final String value;
  final bool isSelect;

  _SlideItem({
    this.itemHeight,
    this.itemWidth,
    this.textStyle,
    this.selTextStyle,
    this.selectBg,
    this.value,
    this.isSelect,
  });

  final _defText = TextStyle(color: Color(0xff333333), fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: itemWidth,
        height: itemHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: isSelect ? const LinearGradient(colors: [Color(0xFFFF8E70), Color(0xFFFF8BFB)]) : null,
        ),
        child: Text(
          value ?? '',
          style: isSelect ? selTextStyle ?? _defText : textStyle ?? _defText,
        ),
      ),
    );
  }
}
