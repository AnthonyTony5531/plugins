//**********************************************************************
//* author:Sam
//* date:2020-06-06
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/widgets/loading_widget/loading_circular.dart';
import 'package:flutter/material.dart';

import '../view_helper.dart';

class LoadingOverlay{
  BuildContext _context;
  LoadingOverlay.of(BuildContext context){
    this._context = context;
  }

  OverlayEntry _entry;

  void show({String text, bool cancel = true }){
    Overlay.of(_context).insert(_entry = OverlayEntry(
      builder: (_){
        return _LoadingOverlay(overlayEntry:_entry, text: text,cancel: cancel,);
      }
    ));
  }

  void dispose(){
    _entry?.remove();
  }

}

class _LoadingOverlay extends StatelessWidget {
  final String text;
  final bool cancel;
  final OverlayEntry overlayEntry;

  const _LoadingOverlay({Key key, this.overlayEntry, this.text, this.cancel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: ()async{
          if(cancel){
            overlayEntry?.remove();
          }
        },
        child: Container(
          color: Colors.black.withOpacity(0.6),
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
                      child: TextHelper.buildNormal(text??"${config.langMap['baseLang']['message']['loading']}"),
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
