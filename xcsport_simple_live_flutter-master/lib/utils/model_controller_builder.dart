
import 'dart:async';

import 'package:flutter/material.dart';

typedef ModelWidgetBuilder<TModel> = Widget Function(BuildContext context, TModel model);

class ModelControllerBuilder<TModel, TController extends ModelController<TModel>> extends StatefulWidget {
  final ModelController<TModel> controller;
  final ModelWidgetBuilder<TModel> builder;
  const ModelControllerBuilder({Key key,@required this.controller, @required this.builder}) : 
  assert(builder != null), 
  assert(controller != null), 
  super(key: key);

  @override
  _ModelControllerBuilderState createState() => _ModelControllerBuilderState<TModel, TController>();
}

class _ModelControllerBuilderState<TModel, TController extends ModelController<TModel>> extends State<ModelControllerBuilder<TModel, TController>> {

  ModelController<TModel> get controller{
    return widget.controller;
  }

  TModel lastModel;
  @override
  void initState() {
    lastModel = controller.defaultModel;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.controller != null){
      var ret = StreamBuilder(
        stream: controller.createModelStream(),
        initialData: lastModel,
        builder: (BuildContext context, AsyncSnapshot<TModel> snapshot) {
          if(snapshot.hasData && snapshot.data != null){
            lastModel = snapshot.data;
            return widget.builder(context, snapshot.data); 
          }
          return widget.builder(context, lastModel);
        },
      );
      return ret;
    }else{
      return widget.builder(context, lastModel);
    }
  }
}

class ModelController<TModel> {

  ModelController({
    @required TModel defaultModel
  }): 
    _defaultModel = defaultModel,
    assert(defaultModel != null)
  ;

  TModel _defaultModel;
  TModel get defaultModel => _defaultModel;
  
  StreamController<TModel> _model;
  Stream<TModel>  createModelStream(){
    if(_model != null){
      _model.close();
    }
    _model = StreamController<TModel>();
    return  _model.stream;
  }
  void setModel(TModel model) {
    _currentModel = model;
    if(_model != null){
      _model.sink.add(model);
    }
  }

  void update(){
    if(_model != null){
      _model.sink.add(_currentModel);
    }
  }

  TModel _currentModel;
  TModel get currentModel{
    return _currentModel ?? defaultModel;
  }
  
  dispose(){
    _model.close();
  }
}


class VoidListener{
  List<VoidCallback> _callbacks = [];
  fire(){
    _callbacks.forEach((f)=>f());
    if(_parentListener != null){
      _parentListener.fire();
    }
  }
  addListener(VoidCallback callback){
    _callbacks.add(callback);
  }
  removeListener(VoidCallback callback){
    _callbacks.remove(callback);
  }

  VoidListener _parentListener;
  setParent(VoidListener parent){
    _parentListener = parent;
  }
}


class MatchOverListener{
  var _callbacks = Set<VoidCallback>();


  int get len => _callbacks.length;

  fire(){
    _callbacks.forEach((f)=>f());
  }
  addListener(VoidCallback callback){
    _callbacks.add(callback);
  }
  removeListener(VoidCallback callback){
    _callbacks.remove(callback);
  }

  clear(){
    _callbacks.clear();
  }
}

class ValueChangedListener<T>{
  List<ValueChanged<T>> _callbacks = [];
  fire(T value){
    _callbacks.forEach((f)=>f(value));
    if(_parentListener != null){
      _parentListener.fire();
    }
  }
  addListener(ValueChanged<T> callback){
    _callbacks.add(callback);
  }
  removeListener(ValueChanged<T> callback){
    _callbacks.remove(callback);
  }

  cleanListener(){
    _callbacks.clear();
  }

  VoidListener _parentListener;
  setParent(VoidListener parent){
    _parentListener = parent;
  }
}

