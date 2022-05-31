import 'dart:async';
import 'package:flutter/cupertino.dart';


abstract class Model {
  ModelState state;

  void notifyListeners() {
    state?.updateState();
  }

  // ignore: missing_return
  Future<void> refresh([Map<String, dynamic> args]) async {}
}

abstract class ModelView<M> extends StatefulWidget {
  final M model;

  const ModelView({Key key, @required this.model}) : super(key: key);
}

abstract class ModelState<M extends Model, V extends ModelView<M>> extends State<V> {

  num seq = 0;
  static num gseq = 0;

  M get defaultModel;

  M get model {
    return widget.model ?? defaultModel;
  }

  M _oldModel;

  @override
  void initState() {
    seq = ++gseq;
    _oldModel = this.model;
    this.model.state = this;
    super.initState();
  }

  @override
  void dispose() {
    this.stopTimer();
    this.model.state = null;
    super.dispose();
  }

  Widget cache;

  //是否需要进行重构渲染.默认每次都需要
  bool shouldRebuild(M oldModle, M newModle) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (_oldModel != this.model) {
      this.model.state = this;
    }
    if (null == cache || shouldRebuild(_oldModel, model)) {
      cache = rander(context);
    }
    _oldModel = this.model;
    return cache;
  }

  Widget rander(BuildContext context);

  void updateState([VoidCallback fn]) {
    if (this.mounted) {
      if (fn == null)
        super.setState(() {});
      else
        super.setState(fn);
    }
  }

  Timer _timer;
  int _timerCount = 0;
  bool _isTimeProccessing = false;

  void startTimer([int milliseconds]) {
    if (_timer != null) return;
    _timer = Timer.periodic(Duration(milliseconds: milliseconds), (timer) {
      if (!mounted) {
        return;
      }
      _timer = timer;
      if (_isTimeProccessing) return;
      _timerCount++;
      _isTimeProccessing = true;
      try {
        onTime(_timerCount, timer);
      } catch (e) {
//        logger.error(e);
      }
      _isTimeProccessing = false;
    });
  }

  void resetCount() {
    _timerCount = 0;
  }

  void stopTimer() {
    if (_timer == null) return;
    try {
      _timer?.cancel();
    } catch (e) {
//      logger.error(e);
    }
    _timer = null;
    _timerCount = 0;
  }

  void onTime(int count, Timer timer) {}
}
