// @author king
// @date 2021-05-21

import 'dart:async';

import 'package:common_component/mvvm/view/view_observer.dart';
import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:common_component/theme/view_style.dart';
import 'package:common_component/util/disposable_reference.dart';
import 'package:flutter/widgets.dart';

//有状态的视图
abstract class StatefulView<S extends ViewStyle, M extends StatefulViewModel<S>>
    extends StatefulWidget {
  final M model;

  const StatefulView({Key key, @required this.model}) : super(key: key);
}

abstract class ViewState<S extends ViewStyle, M extends StatefulViewModel<S>,
    V extends StatefulView<S, M>> extends State<V> implements ViewObserver {
  //全部的皮肤列表

  num seq = 0;

  static num gseq = 0;

  S get style {
    assert(null != model.style, "warn: style is null or empty");
    return model.style;
  }

  M get defaultModel;
  DisposableReference<M> modelDR;
  M get model {
    return widget.model ?? defaultModel;
  }

  M _oldModel;

  @override
  void initState() {
    seq = ++gseq;
    _oldModel = this.model;
    onModelChangeBefore();
    this.model.attach(this);
    super.initState();
  }

  ///一般用作于列表中model对象变换时候在这处理业务。
  void onModelChangeBefore() {}

  @override
  void didUpdateWidget(V oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_oldModel != model) {
      seq = ++gseq;
      _oldModel?.detach();
      onModelChangeBefore();
      model.didModelUpdate(_oldModel, model);
      model.attach(this, shouldDoUpdated: true);
    } else {
      //共用一个widget可能会被释放掉
      if (!model.isActive) {
       model.attach(this, shouldDoUpdated: true);
      }
      model.didModelUpdate(_oldModel, model);
    }
  }

  @override
  void dispose() {
    cache = null;
    model.detach();
    _oldModel = null;
    this.stopTimer();
    super.dispose();
  }

  Widget cache;

  //是否需要进行重构渲染.默认每次都需要
  bool shouldRebuild(M oldModle, M newModle) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (null == cache || shouldRebuild(_oldModel, model)) {
      cache = render(context);
    }
    _oldModel = this.model;
    return cache;
  }

  @override
  void onDataUpdatedAfter() {}

  Widget render(BuildContext context);

  @override
  void setState(fn) {
    if (this.mounted) {
      final dynamic result = fn?.call() as dynamic;
      assert(() {
        if (result is Future) {
          throw FlutterError.fromParts(<DiagnosticsNode>[
            ErrorSummary('setState() callback argument returned a Future.'),
            ErrorDescription(
                'The setState() method on $this was called with a closure or method that '
                'returned a Future. Maybe it is marked as "async".'),
            ErrorHint(
                'Instead of performing asynchronous work inside a call to setState(), first '
                'execute the work (without updating the widget state), and then synchronously '
                'update the state inside a call to setState().'),
          ]);
        }
        // We ignore other types of return values so that you can do things like:
        //   setState(() => x = 3);
        return true;
      }());
      super.setState(() {
        onDataUpdatedAfter();
      });
    }
  }

  @override
  void updateState([VoidCallback fn]) {
    this.setState(fn);
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
      } catch (e, stack) {
        // logger.error(e);
        print('e:$e');
        print('stack:$stack');
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
      // logger.error(e);
    }
    _timer = null;
    _timerCount = 0;
  }

  void onTime(int count, Timer timer) {}
}
