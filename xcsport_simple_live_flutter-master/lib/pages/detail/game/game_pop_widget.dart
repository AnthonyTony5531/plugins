import 'dart:async';

import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/pages/detail/chatroom/message/bean/game_notify_message.dart';
import 'package:flutter/material.dart';

class GamePopWidget extends StatefulWidget {
  final Function(String, String, String, String) onPlayerGame;

  GamePopWidget({this.onPlayerGame});

  @override
  State<StatefulWidget> createState() => _GamePopState();
}

class _GamePopState extends State<GamePopWidget> {
  StreamSubscription<GameNotifyEvent> gameNotifySubscription;

  List<GameNotifyMessage> _messageList = [];
  List<GameNotifyMessage> _showList = [];

  Timer _pollingTimer;
  bool _isOpenTimer = false;

  int get itemLength {
    final len = _showList.length;
    if (len >= 2) return 2;
    return len;
  }

  @override
  void initState() {
    super.initState();
    gameNotifySubscription = Event.eventBus.on<GameNotifyEvent>().listen((item) {
      if (item.message == null || !item.message.isTrue) return;
      _messageList.add(item.message);
      _showNextItem();
      startPollingTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pollingTimer?.cancel();
    gameNotifySubscription.cancel();
  }

  void startPollingTimer() {
    if (_isOpenTimer) return;
    _isOpenTimer = true;
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _removeShowItem();
      _showNextItem();
    });
  }

  // 显示下一个
  void _showNextItem() {
    if (_messageList.isNotEmpty && itemLength <= 1) {
      final item = _messageList.first;
      _showList.insert(0, item);
      _messageList.removeAt(0);
      _uploadState();
    } else if (itemLength == 0) {
      _isOpenTimer = false;
      _pollingTimer?.cancel();
    }
  }

  // 删除最先显示的item
  void _removeShowItem() {
    if (itemLength != 0) {
      _showList.removeLast();
      _uploadState();
    }
  }

  void _uploadState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 38.0,
      child: ListView.separated(
        controller: ScrollController(),
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemLength,
        reverse: true,
        separatorBuilder: (cxt, index) => const SizedBox(height: 4.0),
        itemBuilder: (cxt, index) {
          final item = _showList[index];
          if (index == 0) return _buildFirstItem(item);
          if (index == 1) return _buildSecondItem(item);
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildFirstItem(GameNotifyMessage item) {
    return GestureDetector(
      onTap: () => widget.onPlayerGame?.call(item.gameKey, item.supplierId, item.gameType, item.tableId),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(child: const SizedBox()),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150.0),
                  child: Text(
                    item.listItemName,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 9.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: SizedBox(
              width: 6.0,
              height: 4.0,
              child: CustomPaint(
                painter: _TrianglePainter(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondItem(GameNotifyMessage item) {
    return GestureDetector(
      onTap: () => widget.onPlayerGame?.call(item.gameKey, item.supplierId, item.gameType, item.tableId),
      child: Row(
        children: [
          Expanded(child: const SizedBox()),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 150.0),
              child: Text(
                item.listItemName,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 9.0, color: Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter({this.color});

  Paint _paint = Paint()
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = color;
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
