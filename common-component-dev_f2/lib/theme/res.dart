import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

//资源加载提供者
abstract class Res {
  final String packageName;
  TextCreator get textCreator;
  ImageCreator get imageCreator;
  const Res({this.packageName});
}

abstract class TextCreator {
  final String packageName;
  const TextCreator({this.packageName});

  TextStyle style({
    bool inherit = true,
    Color color,
    Color backgroundColor,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint foreground,
    Paint background,
    List<Shadow> shadows,
    List<FontFeature> fontFeatures,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    double decorationThickness,
    String debugLabel,
    String fontFamily,
    List<String> fontFamilyFallback,
  }) {
    return TextStyle(
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: this.packageName,
    );
  }
}

abstract class ImageCreator {
  final String packageName;

  const ImageCreator({this.packageName});

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
    return Image.asset(name,
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
        package: packageName,
        filterQuality: filterQuality,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight);
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

  Widget fromUrl(
    String url, {
    BoxFit fit = BoxFit.cover,
    double width,
    double height,
    bool useOldImageOnUrlChange = false,
    Widget errorWidget,
    Widget placeWidget,
    Color placeColor = const Color(0xffE1E2E6),
    // Widget imageBuilder(BuildContext context, ImageProvider imageProvider),
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      // imageBuilder: imageBuilder,
      fit: fit,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      errorWidget: (cxt, _, __) =>
          errorWidget ??
          Container(
            width: width,
            height: height,
            color: placeColor,
          ),
      placeholder: (cxt, _) =>
          placeWidget ??
          Container(
            width: width,
            height: height,
            color: placeColor,
          ),
    );
  }

  
}
