  
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-24
 * 显示的版本
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:fast_ai/config/config.dart';

enum DisplayVersion{
  ///老鸟版
  Laoniao,
  //小白版
  Xiaobai
}

displayVersion(DisplayVersion displayVersion){
  switch(displayVersion){
    case DisplayVersion.Laoniao:
      return config.langMap['baseLang']['laoniao'];
    case DisplayVersion.Xiaobai:
      return config.langMap['baseLang']['xiaobai'];
  }
  return "";
}

