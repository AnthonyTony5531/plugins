import 'package:common_component/mvvm/viewmodel/stateful_viewmodel.dart';
import 'package:fast_ai/pages/activity_page/activity_draw_progress/activity_draw_progress_style.dart';
import 'package:fast_ai/utils/ai_date.dart';
import 'package:flutter/cupertino.dart';

class ActivityDrawProgressViewModel extends StatefulViewModel<ActivityDrawProgressStyle> {
  // 时间
  int createTime;

  ActivityDrawProgressViewModel.create({@required this.createTime});

  void upData({@required num createTime}){
    this.createTime = createTime ?? 0;
    refresh();
  }

  ActivityDrawProgressViewModel();

  @override
  List<ActivityDrawProgressStyle> get styleList => [ActivityDrawProgressStyle()];

  // 时间戳
  int _timeF = 0;
  int get timeF => _timeF;

  // 进度时间 09：10：10
  String _timeS = '';
  String get timeS => _timeS;

  // 进度
  double _poolRateS = 0;
  double get poolRateS => _poolRateS;

  // 进度条宽度
  double _width = 46.0;
  double get width => _width;

  // 进度条高度
  double _height = 10.0;
  double get height => _height;

  int time = 24 * 60 * 60 * 1000;

  double _fenNum = 0.0;

  @override
  Future<bool> onInit() async{
    await refresh();
    return false;
  }

  void configRefresh(){
    notifyStateChanged();
  }

  void _configTime(){
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (createTime < nowTime) {
      int sucTime = nowTime - createTime;
      int timeSS = time - sucTime;
      _timeF = timeSS~/1000;
    } else {
      _timeF = time~/1000;
    }
    if (_timeF > 0) {
      _configPoolRateTime(_timeF.toDouble());
      _timeS = AiDate.constructTime(_timeF);
    }
    notifyStateChanged();
  }

  // 计算进度
  void _configPoolRateTime(double sTime){
    double ssTime = sTime * 1000;
    _poolRateS = ssTime * _fenNum;
    if (_poolRateS > _width) {
      _poolRateS = _width;
    }
  }

  void upDate(){
    if (_timeF > 0) {
      _timeF -= 1;
      _timeS = AiDate.constructTime(_timeF);
      _configPoolRateTime(_timeF.toDouble());
    }
    notifyStateChanged();
  }

  @override
  Future<dynamic> refresh([Map<String, dynamic> args]) {
    _fenNum = _width/time;
    _configTime();
    return super.refresh(args);
  }

}