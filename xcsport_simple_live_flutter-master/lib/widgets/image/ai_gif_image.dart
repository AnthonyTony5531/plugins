//**********************************************************************
//* author:Sam
//* date:2020-05-07
//**********************************************************************

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:fast_ai/migrate_plugins/flutter_gifimage/flutter_gifimage.dart';

class AiGifImage extends StatefulWidget {
  final String path;
  final AiGifImageController controller;
  final bool usePackage;
  final double max;
  final ValueChanged<bool> playCompleteCallback;
  final bool fetchCompletedPlay;
  final int duration;
  final bool userInternational;

  AiGifImage(
      {Key key,
      this.path,
      this.controller,
      this.usePackage = true,
      this.max,
      this.playCompleteCallback,
      this.fetchCompletedPlay = true,
      this.userInternational = false,
      this.duration = 800})
      : super(key: controller._globalKey);

  @override
  _AiGifImageState createState() => _AiGifImageState();
}

class AiGifImageController {
  final GlobalKey<_AiGifImageState> _globalKey =
      new GlobalKey<_AiGifImageState>();
  void repeat() {
    print("repeat");
    _globalKey.currentState?.repeat();
  }
}

class _AiGifImageState extends State<AiGifImage> with TickerProviderStateMixin {
  GifController gifController;
  @override
  void initState() {
    try {
      gifController = new GifController(
          value: 0,
          duration: Duration(milliseconds: widget.duration),
          vsync: this);
      gifController.addStatusListener((status) {
        if (status == AnimationStatus.completed &&
            widget.playCompleteCallback != null) {
          widget.playCompleteCallback(true);
        }
      });
      if (widget.fetchCompletedPlay == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          repeat();
        });
      }
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  void repeat() {
    gifController.value = 0;
    gifController.animateTo(
      widget.max,
      duration: Duration(milliseconds: widget.duration),
    );
  }

  @override
  void dispose() {
    gifController?.stop();
    gifController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String curName = widget.path;
    if (config.isNeedInternationalImg && (widget.userInternational ?? false)) {
      curName = config.assetService.getLangResAssetUrl(widget.path, Translations.langCode, Config.ccPackage);
    }

    return GifImage(
      controller: gifController,
      onFetchCompleted: () {
        if (widget.fetchCompletedPlay) {
          repeat();
        }
      },
      fit: BoxFit.cover,
      image: AiImage.assetImage(curName,usePackage:widget.usePackage),
    );
  }
}
