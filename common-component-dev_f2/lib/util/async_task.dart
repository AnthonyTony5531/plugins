// @author king 
// @date 2020-12-23

//异步任务管理类

class AsyncTask{

  var _futures = <Future>[];

  AsyncTask addFuture(Future future){
    _futures.add(future);
    return this;
  }

  AsyncTask addFutures(List<Future> futures){
    _futures.addAll(futures);
    return this;
  }

  List  _results = [];

  Future<AsyncTask> wait()async{
    _results.addAll(await Future.wait(_futures));
    return this;
  }



  T get<T>() {
    return _results.firstWhere((f)=>f.runtimeType == _typeOf<T>()) as T;
  }

  List<T>   getList<T>() {
    return []..addAll(_results.where((f)=>f.runtimeType == _typeOf<T>()).map<T>((f)=>f as T).toList());
  }

  Type _typeOf<T>() => T;


}