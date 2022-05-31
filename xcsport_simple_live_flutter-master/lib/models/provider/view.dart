//**********************************************************************
//* author:Sam
//* date:2020-08-31
//**********************************************************************


import 'package:fast_ai/models/provider/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


abstract class SingleViewModelStatelessView<VM extends ViewModel> extends StatelessWidget {

  Widget buildView(BuildContext context, VM viewModel);
  VM _viewModel;
  VM get viewModel =>  _viewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<VM>(
      builder: (_, model, __){
        _viewModel = model;
        return buildView(context, _viewModel);
      },
    );
  }
}

typedef SingleViewModelStatelessViewBuilder<VM extends ViewModel> = Widget Function(BuildContext context, VM viewModel);

// ignore: must_be_immutable
class SingleViewModelStatelessViewCreator<VM extends ViewModel> extends StatelessWidget{

  final VM _vm;

  final SingleViewModelStatelessViewBuilder<VM> create;

  SingleViewModelStatelessViewCreator({VM viewModel, this.create}):_vm= viewModel;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>(create: (context)=>_vm, child:  Consumer<VM>(
      builder: (_, model, __){
        return create(context, model);
      },
    ));
  }
}




abstract class SingleViewModelStatefullViewState<V extends StatefulWidget, VM extends ViewModel> extends State<V> {

  VM  _viewModel ;

  VM  get  viewModel=>_viewModel;


  VM  get  onViewModelsCreate;

  Widget buildView(BuildContext context,VM vm );

  @override
  void initState() {
    super.initState();
    _viewModel = onViewModelsCreate;

  }

  @override
  void didChangeDependencies() {
    //_viewModel = onViewModelsCreate;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>(create: (_)=>_viewModel,child: Consumer<VM>(
        builder: (_, model, __){
      return buildView(context, model);
    },
    ) ,);
  }


  @override
  void dispose() {
   // _viewModel?.dispose();
    super.dispose();
  }
}

abstract class SingleViewModelStatefullViewState2<V extends StatefulWidget, VM extends ViewModel> extends State<V> {

  VM  _viewModel ;

  VM  get  viewModel=>_viewModel;


  VM  get  onViewModelsCreate;

  Widget buildView(BuildContext context,VM vm );

  @override
  void initState() {
    super.initState();
    _viewModel = onViewModelsCreate;

  }

  @override
  void didChangeDependencies() {
    _viewModel = onViewModelsCreate;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VM>.value(value: _viewModel,child: Consumer<VM>(
      builder: (_, model, __){
        return buildView(context, model);
      },
    ) ,);
  }


  @override
  void dispose() {
    // _viewModel?.dispose();
    super.dispose();
  }
}
