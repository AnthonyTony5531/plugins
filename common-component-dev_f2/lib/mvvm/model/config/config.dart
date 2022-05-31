// @author king
// @date 2021-05-21

//用来记录一些设置属性值。一般用来APP启动初始化加载存储的一些参数，或者是一些用户的持久化数据
//将这类归类为配置。通常只有get,set,和初始化，加载方法。
//注意：
//1:如果有复杂的业务，请用service处理后，config存储
//2:get 方法不能进行查询和遍历操作，比如for循环，数据量多的map取值
//3:set 方法耗时任务不允许同步操作，耗时任务要异步
import 'dart:collection';

abstract class IConfig{

  static final  configs = HashMap<String, IConfig>();

  String get name;
  //
  Future<void> init(){
    IConfig.configs[name]=this;
    return null;
  }

}