import 'package:common_component/util/listeners/void_listener.dart';
import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:fast_ai/widgets/view_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String text;
  bool cancel;
  bool _isShowing = false;

  bool get isShowing => _isShowing;

  LoadingDialog.create(this.text, {this.cancel = true, this.onForceClose});

  //手动按掉dialog回调
  VoidCallback onForceClose;


  VoidListener dismissListener = new VoidListener();

  void show(BuildContext context) {
    Future.sync((){
      Dialog dialog = this;
      _isShowing = true;
      showDialog(
          context: context,
          barrierDismissible: cancel,
          builder: (context) {
            buildContext = context;
            return dialog;
          });
    });

  }

  BuildContext buildContext;

  void  dismiss() async {
    if (_isShowing) {
      _isShowing = false;
      dismissListener.fire();
    }
  }

  @override
  Widget build(BuildContext context) {

    return _LoadingView(
      cancel: cancel,
      listener: dismissListener,
      onForceClose: onForceClose,
      text: text,
    );
  }
}

class _LoadingView extends StatefulWidget {
  final bool cancel;
  final VoidCallback onForceClose;
  final String text;
  VoidListener listener;
   _LoadingView({Key key, this.cancel, this.onForceClose, this.text, this.listener})
      : super(key: key);

  @override
  __LoadingViewState createState() => __LoadingViewState();
}

class __LoadingViewState extends State<_LoadingView> {


  @override
  void initState() {
    super.initState();
    widget.listener.addListener(onDismissListener);
  }

  void onDismissListener(){
    widget.listener.removeListener(onDismissListener);
    widget.listener = null;
    Navigator.pop(context);
  }


  @override
  void dispose() {
    super.dispose();
    widget.listener?.removeListener(onDismissListener);
    widget.listener = null;

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () async {
          if (widget.cancel) {
            Navigator.pop(context);
            widget.onForceClose?.call();
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Container(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LoadingCircular(),
                    InterValHelper.h(20),
                    Container(
                      child: TextHelper.buildNormal(widget.text??"${config.langMap['baseLang']['message']['loading']}"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
