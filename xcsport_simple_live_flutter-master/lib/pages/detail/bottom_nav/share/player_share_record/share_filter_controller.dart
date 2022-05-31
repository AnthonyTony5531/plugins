import 'dart:ui';

class ShareFilterController{

  final String gidm;

  ShareFilterController({this.gidm}){
    //_filterGidm = gidm;
  }

  //////////////////////////////////////////////////////////////////////////////
  ///排序：1 按时间，2按胜率
  // String _orderBy = '1';
  //
  // String get orderBy => _orderBy;

  // void setOrderBy(int position,{bool notifyAll = true}){
  //   String oOrderBy = _orderBy;
  //   if(position == 0){
  //     _orderBy = '2';
  //   } else {
  //     _orderBy = '1';
  //   }
  //   if(_orderBy != oOrderBy){
  //     if(notifyAll){
  //       _notifyChange(FilterType.orderBy);
  //     }
  //     _notifyUiChange();
  //   }
  // }

  //////////////////////////////////////////////////////////////////////////////
  ///是否只显示本场比赛相关数据
  String _filterGidm = '';

  String get filterGidm => _filterGidm;

  void setFilterGidm(bool select,{bool notifyAll = true}){
    if(select){
      _filterGidm = gidm;
    } else {
      _filterGidm = '';
    }
    if(notifyAll){
      _notifyChange(FilterType.game);
    }
    _notifyUiChange();
  }

  //////////////////////////////////////////////////////////////////////////////
  ///是否显示关注项：1只显示关注 2显示全部
  String _filterAttention = '2';

  String get filterAttention => _filterAttention;

  void setFilterAttention(bool select,{bool notifyAll = true}){
    if(select){
      _filterAttention = '1';
    } else {
      _filterAttention = '2';
    }
    if(notifyAll){
      _notifyChange(FilterType.attention);
    }
    _notifyUiChange();
  }

  //////////////////////////////////////////////////////////////////////////////
  ///改变监听器
  var listeners = Set<FilterChange>();

  void addListener(FilterChange listener){
    listeners.add(listener);
  }

  void removeListener(FilterChange listener){
    listeners.remove(listener);
  }

  void _notifyChange(FilterType filterType){
    listeners?.forEach((cb){
      cb(filterType);
    });
  }

  ///ui刷新监听器
  var _onlyUiListeners = Set<VoidCallback>();

  void addUiListener(VoidCallback listener){
    _onlyUiListeners.add(listener);
  }

  void removeUiListener(VoidCallback listener){
    _onlyUiListeners.remove(listener);
  }

  void _notifyUiChange(){
    _onlyUiListeners?.forEach((cb){
      cb();
    });
  }

}

enum FilterType{
  game,attention,orderBy
}

typedef FilterChange = void Function(FilterType filterType);

