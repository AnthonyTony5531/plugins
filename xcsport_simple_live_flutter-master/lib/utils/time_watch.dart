
class TimeWatch{
  DateTime _loadTime;
  final Duration _duration;
  TimeWatch(this._duration);

  bool canTodo(){
    if(_loadTime == null){
      _loadTime = DateTime.now();
      return true;
    }
    return false;
  }

  void resetWithTimeout(){
    assert(_loadTime != null,"canTodo");
    var diffTime = DateTime.now().difference(_loadTime);
    if(diffTime > _duration){
      _loadTime = null;
    }
  }

  void reset(){
    _loadTime = null;
  }
}
