
///
/// ContainerPage列表滚动状态的
///
class ContainerPageScrollStatusMgr{

  ///
  bool _scrolling = false;

  bool get scrolling => _scrolling;

  set scrolling(bool status){
    bool change = status != _scrolling;
    _scrolling = status;
    if(change){
      Future.delayed(Duration(milliseconds: 10),(){
        notify();
      });
    }
  }

  List<ScrollStatusChange> _scrollStatusListeners = [];

  void addListener(ScrollStatusChange listener){
    _scrollStatusListeners.add(listener);
  }

  void removeListener(ScrollStatusChange listener){
    _scrollStatusListeners.remove(listener);
  }

  void notify(){
    _scrollStatusListeners.forEach((l){
      if(l != null){
        l(scrolling);
      }
    });
  }
}

typedef ScrollStatusChange = void Function(bool scrolling);