import 'package:flutter/material.dart';

import 'fresh_status.dart';

/// @author king
/// @date 2021/5/29
/// 刷新状态管理的类.空数据状态于成功或失败状态并存。
mixin FreshStatusMixin {
  //刷新状态
  int _freshStatus = FreshStatus.None;

  //是否获取数据成功
  bool isSuccess() {
    return isCurrentStatusContain(FreshStatus.Success);
  }

  //是否获取数据失败
  bool isError() {
    return isCurrentStatusContain(FreshStatus.Error);
  }

  //是否默认状态
  bool isNoneStatus() {
    return _freshStatus == FreshStatus.None;
  }

  //是否获取到的数据是空的
  bool isEmpty() {
    return isCurrentStatusContain(FreshStatus.Empty);
  }

  //获取数据成功了并且数据为空
  bool isSuccessEmpty(){
    return isSuccess() && isEmpty();
  }

  //获取数据失败，并且数据为空
  bool isErrorEmpty(){
    return isError() && isEmpty();
  }

  //是否是刷新状态
  bool isRefreshing(){
    return _freshStatus == FreshStatus.Refreshing;
  }

  //设置当前状态为初始状态
  void makeNoneStatus() {
    _freshStatus = FreshStatus.None;
  }

  //设置当前状态为刷新状态
  void makeRefreshingStatus() {
    _freshStatus = FreshStatus.Refreshing;
  }

  //设置当前状态为成功状态
  void makeSuccessStatus() {
    _freshStatus = FreshStatus.Success;
  }

  //设置当前状态为错误状态
  void makeErrorStatus() {
    _freshStatus = FreshStatus.Error;
  }

  /// isError 是执行成功的空数据，还是错误的空数据
  void makeEmptyStatus({@required bool isError}) {
    assert(isError!= null, "setEmptyStatus需要加入isError参数");
    if (isError) {
      addErrorStatus();
    }else{
      addSuccessStatus();
    }
    _addFreshStatus(FreshStatus.Empty);
  }

  //
  bool isCurrentStatusContain(int status) {
    return isStatusContain(_freshStatus, status);
  }

  bool isStatusContain(int container, int status ) {
    return container & status != 0;
  }

  void _addFreshStatus(int status) {
    if (status == FreshStatus.Success) {
      if (isCurrentStatusContain(FreshStatus.Error)) {
        _removeFreshStatus(FreshStatus.Error);
      }
    } else if ( status == FreshStatus.Error) {
      if (isCurrentStatusContain(FreshStatus.Success)) {
        _removeFreshStatus(FreshStatus.Success);
      }
    } else if(status == FreshStatus.Refreshing){
      _freshStatus =  FreshStatus.Refreshing;
    } else if(status == FreshStatus.None){
      _freshStatus = FreshStatus.None;
    }
    if (status != FreshStatus.None) {
      if (isCurrentStatusContain(FreshStatus.None)) {
        _removeFreshStatus(FreshStatus.None);
      }
    }
    _freshStatus |= status;
  }

  void _removeFreshStatus(int status) {
    _freshStatus &= ~status;
  }

  void addSuccessStatus() {
    _addFreshStatus(FreshStatus.Success);
  }

  void removeSuccessStatus() {
    _removeFreshStatus(FreshStatus.Success);
  }

  void addErrorStatus() {
    _addFreshStatus(FreshStatus.Error);
  }

  void removeErrorStatus() {
    _removeFreshStatus(FreshStatus.Error);
  }


}
