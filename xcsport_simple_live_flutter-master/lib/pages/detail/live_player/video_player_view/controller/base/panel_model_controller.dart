import 'dart:async';
import 'package:flutter/material.dart';

/// PanelModelController
abstract class PanelModelController<T> {
  PanelModelController({@required T model}) : _model = model;

  StreamController<T> _streamController;
  T _model;
  T get model => _model;
  set model(T newValue) {
    _model = newValue;
    if(_streamController != null){
      _streamController.sink.add(_model);
    }
  }

  Stream<T>stream() {
    if(_streamController != null) {
      _streamController.close();
    }
    _streamController = StreamController<T>();
    return _streamController.stream;
  }

  void update() {
    if(_streamController == null) return;

    _streamController.sink.add(_model);
  }

  dispose() {
    _streamController?.close();
  }
}