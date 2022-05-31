// @author king
// @date 2021-05-21


import 'disposable.dart';

//对象引用持有管理类.这个类没有真正实现弱引用这种效果，只是告诉开发，
// 这个类持有的引用用完后必须要释放，务必在托管资源的生命周期的释放方法内进行dispose
class DisposableReference<I> extends IDisposable{

  I  _ins;

  DisposableReference(I ins){
    _ins = ins;
  }

  get ins => _ins;

  @override
  void dispose(){
    _ins  = null;
  }
}