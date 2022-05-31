import 'dart:io';

import 'package:common_component/package/package.dart';
import 'package:common_component/theme/res.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/util/empty_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../string/string_util.dart';

class CommonImageCreator extends ImageCreator {
  IPackage package;

  CommonImageCreator({this.package}) : super(packageName: package.name);

  @override
  Widget fromUrl(
    String url, {
    BoxFit fit = BoxFit.cover,
    double width,
    double height,
    bool useOldImageOnUrlChange = false,
    Widget errorWidget,
    Widget placeWidget,
    Color placeColor = const Color(0xffE1E2E6),
    String errorFile,
    String placeFile,
  }) {
    url = url?.toImageUrl() ?? '';
    if (null == errorWidget && isNotEmpty(errorFile)) {
      if (string(errorFile).endsWith('svg')) {
        errorWidget = Container(
          color: placeColor,
          child: package.res.imageCreator.assetSvgImage(
            errorFile,
            fit: fit,
            width: width,
            height: height,
          ),
        );
      } else {
        errorWidget = Container(
          color: placeColor,
          child: package.res.imageCreator.assetImage(
            errorFile,
            fit: fit,
            width: width,
            height: height,
          ),
        );
      }
    }
    if (null == placeWidget && isNotEmpty(placeFile)) {
      if (string(errorFile).endsWith('svg')) {
        placeWidget = Container(
          color: placeColor,
          child: package.res.imageCreator.assetSvgImage(
            placeFile,
            fit: fit,
            width: width,
            height: height,
          ),
        );
      } else {
        placeWidget = Container(
          color: placeColor,
          width: width,
          height: height,
          child: package.res.imageCreator.assetImage(
            placeFile,
            fit: fit,
            width: width,
            height: height,
          ),
        );
      }
    }
    return super.fromUrl(
      string(url),
      fit: fit,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      errorWidget: errorWidget,
      placeWidget: placeWidget,
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      placeColor: placeColor,
    );
  }



  Widget assetSvgImage(
      String assetName, {
        Key key,
        bool matchTextDirection = false,
        AssetBundle bundle,
        String package,
        double width,
        double height,
        BoxFit fit = BoxFit.contain,
        AlignmentGeometry alignment = Alignment.center,
        bool allowDrawingOutsideViewBox = false,
        WidgetBuilder placeholderBuilder,
        Color color,
        BlendMode colorBlendMode = BlendMode.srcIn,
        String semanticsLabel,
        bool excludeFromSemantics = false,
      }) {
    return SvgPicture.asset(
      assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: this.packageName,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }



  Widget assetImage(
      String name, {
        Key key,
        AssetBundle bundle,
        ImageFrameBuilder frameBuilder,
        String semanticLabel,
        bool excludeFromSemantics = false,
        double scale,
        double width,
        double height,
        Color color,
        BlendMode colorBlendMode,
        BoxFit fit,
        Alignment alignment = Alignment.center,
        ImageRepeat repeat = ImageRepeat.noRepeat,
        Rect centerSlice,
        bool matchTextDirection = false,
        bool gaplessPlayback = false,
        FilterQuality filterQuality = FilterQuality.low,
        int cacheWidth,
        int cacheHeight,
      }) {
    return Image.asset(
      name,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      package: this.packageName,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }


  Widget fromFile(
    File file, {
    BoxFit fit = BoxFit.cover,
    double width,
    double height,
    double scale = 1.0,
    Widget errorWidget,
    Color placeColor = const Color(0xffE1E2E6),
    String errorFile,
  }) {
    return Image.file(file,
        fit: fit,
        scale: scale,
        width: width ?? double.infinity,
        height: height ?? double.infinity, errorBuilder: (context, e, s) {
      return errorWidget ??
          Container(
            color: placeColor,
            child: package.res.imageCreator.assetImage(
              errorFile,
              fit: fit,
              width: width,
              height: height,
            ),
          );
    });
  }
}
