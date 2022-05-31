
import 'package:common_component/util/listeners/void_listener.dart';
import 'package:flutter/cupertino.dart';


class ValueChangedListener<T>{
  var _callbacks = List<ValueChanged<T>>();
  fire(T value){
    ([]..addAll(_callbacks)).forEach((f){
      try{
        f(value);
      }catch(e,s){
        print('e:$e');
        print('s:$s');

        // bizLog.catchInfo(e.toString(), stack.toString());
        // logger.error(e);
      }
    });
    if(_parentListener != null){
      _parentListener.fire();
    }
  }
  addListener(ValueChanged<T> callback){
    _callbacks.add(callback);
  }

  removeListener(ValueChanged<T> callback){
    _callbacks.removeWhere((element) => element== callback);
  }

  VoidListener _parentListener;
  setParent(VoidListener parent){
    _parentListener = parent;
  }
}

typedef ValueChangedArgs<T> = void Function(T value, dynamic args);
class ValueChangedArgsListener<T>{
  var _callbacks = List<Pair<ValueChangedArgs<T>,dynamic>>();
  fire(T value){
    _callbacks.forEach((f)=>f.first(value, f.second));
    _callbacks.forEach((f){
      try{
        f.first(value, f.second);
      }catch(e,s){
        print('e:$e');
        print('s:$s');
      }
    });
    if(_parentListener != null){
      _parentListener.fire();
    }
  }

  addListener(ValueChangedArgs<T> callback,[dynamic args]){
    _callbacks.add(Pair<ValueChangedArgs<T>, dynamic>(callback, args));
  }

  removeListener(ValueChangedArgs<T> callback){
    var list = _callbacks.where((f)=>f.first == callback).toList();
    list.forEach((f){
      _callbacks.remove(callback);
    });
  }

  VoidListener _parentListener;
  setParent(VoidListener parent){
    _parentListener = parent;
  }
}

class Pair<T1,T2>{
  T1 first;
  T2 second;

  Pair(this.first, this.second);
}

