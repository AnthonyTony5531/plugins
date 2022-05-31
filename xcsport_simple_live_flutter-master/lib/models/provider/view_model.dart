//**********************************************************************
//* author:Sam
//* date:2020-08-31
//**********************************************************************


import 'package:flutter/foundation.dart';

class    ViewModel with ChangeNotifier{
  ShowStatus showStatus = ShowStatus.loading;
  bool isInited= false;

}

enum ShowStatus{
  loading,
  error,
  success,
}