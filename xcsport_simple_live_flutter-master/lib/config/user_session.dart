/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * 说明：
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:fast_ai/utils/util.dart';

class UserSession {

  //系统同步定时器
  num _systemTime = 0;

  num get systemTime{
    return _systemTime;
  }

  setSystemTime(num value){
    if(value == null || value == 0)return;
    _systemTime = value;
  }

  UserSession(){
    runTimer();
  }
  
  runTimer()async{
    while(true){
      await sleep(1000);
      _systemTime = _systemTime + 1000;
    }
  }
}
