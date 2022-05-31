/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * 说明：通用图片处理
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/config/config.dart' as prefix;
import 'package:fast_ai/models/many_name/lang_type.dart';
import 'package:fast_ai/services/sys_service.dart';
import 'package:fast_ai/utils/ai_image_helper.dart';
import 'package:fast_ai/utils/translations.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/imagecache/xc_fade_in_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui show Shadow, FontFeature;

/* ------------ AiFont ------------ */
// ignore: non_constant_identifier_names
TextStyle AiTextStyle({
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
  List<ui.Shadow> shadows,
  List<ui.FontFeature> fontFeatures,
  TextDecoration decoration,
  Color decorationColor,
  TextDecorationStyle decorationStyle,
  double decorationThickness,
  String debugLabel,
  String fontFamily,
  List<String> fontFamilyFallback,
  String package,
}) {
  ///
  /// final TextStyle oddsDownStyle20 = AiTextStyle(
  ///      color: config.skin.colors.attentionColor3,
  ///      fontFamily: config.skin.fontFimaly.liGothicMed,
  ///      fontSize: config.skin.fontSize.h3,
  ///      fontWeight: config.skin.fontWeight.light,
  ///    );
  ///
  /// TextStyle textStyle = AiTextStyle(
  ///      color: Theme.of(context).textTheme.caption.color,
  ///      fontFamily: config.skin.game.oddsDownStyle20.fontFamily,
  ///      fontWeight: config.skin.game.oddsDownStyle20.fontWeight,
  ///      fontSize: config.skin.game.oddsDownStyle20.fontSize,
  ///    );
  ///
  /// Text(gold > 10000 ? '${(gold/10000).toStringAsFixed(2)}w':'${gold.toStringAsFixed(2)}', style: textStyle),
  ///
  if (fontFamily?.startsWith("packages/${package ?? prefix.Config.ccPackage}/") ?? false) {
    fontFamily = fontFamily?.replaceAll("packages/${package ?? prefix.Config.ccPackage}/", "");
  }

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
    height: height ?? 1.1,
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
    package: package ?? prefix.Config.ccPackage,
  );
}

// ignore: non_constant_identifier_names
Text AiText(
  String data, {
  Key key,
  TextStyle style,
  StrutStyle strutStyle,
  TextAlign textAlign,
  TextDirection textDirection,
  Locale locale,
  bool softWrap,
  TextOverflow overflow,
  double textScaleFactor = 1.0,
  int maxLines,
  String semanticsLabel,
  TextWidthBasis textWidthBasis,
}) {
  return Text(
    data,
    key: key,
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
  );
}

class AiFile {
  static String dir(String path) {
    if (prefix.Config.ccPackage == null) {
      return (prefix.config.isApp || !gExportAssets) ? path : "${prefix.config.sdkAssetsModel.sdkAssetsDir}/$path";
    }
    return "packages/${prefix.Config.ccPackage}/$path";
  }

  static String file(String path) {
    if (prefix.Config.ccPackage == null) {
      return (prefix.config.isApp || !gExportAssets) ? path : "file://${prefix.config.sdkAssetsModel.sdkAssetsDir}/$path";
    }
    return "file://packages/${prefix.Config.ccPackage}/$path";
  }
}

/* >>>>>>>>>>>>>>>>>>>>>>>> 以下SDK资源加载共用方法，请不要随意修改 <<<<<<<<<<<<<<<<<<<<<<<< */

File getAssetsFile(String name, bool userInternational) {
  File f;
  if (prefix.config.isNeedInternationalImg && (userInternational ?? false)) {
    int dotIndex = name.lastIndexOf('.');
    String suffix = name.substring(dotIndex);
    String lgName = name.substring(0, dotIndex) + '_${Translations.langCode?.toLowerCase()}' + suffix;

//    debugPrint('suffix ==> $suffix , lgName ==> $lgName');
    f = File('${prefix.config?.sdkAssetsModel?.sdkAssetsDir}/$lgName');

    // 不存在,则默认使用英文版Icon
    if (!f.existsSync()) {
      String enUsName = name.substring(0, dotIndex) + '_${AiLangType.en?.toLowerCase()}' + suffix;
      f = File('${prefix.config?.sdkAssetsModel?.sdkAssetsDir}/$enUsName');
    }
  }

  if (f == null || !f.existsSync()) {
    f = File('${prefix.config?.sdkAssetsModel?.sdkAssetsDir}/$name');
  }

  return f;
}

String getAssetsName(String name, String package, bool userInternational) {

  String curName = name;
  if (prefix.config.isNeedInternationalImg && (userInternational ?? false)) {
    curName = prefix.config.assetService.getLangResAssetUrl(name, Translations.langCode, package);
  }

  return curName;
}

class AiSvgPicture {
  static SvgPicture asset(
    String name, {
    Key key,
    bool matchTextDirection = false,
    AssetBundle bundle,
    String package,
    double width,
    double height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder placeholderBuilder,
    Color color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String semanticsLabel,
    bool excludeFromSemantics = false,
    bool usePackage = true, //果如要显示宿主传过来的图片，则不需要设置package，usePackage = false
    bool useLocalAsset = false, // 显示SDK本地包资源
    bool userInternational = false,
  }) {
    if (prefix.config.isApp || useLocalAsset || !gExportAssets) {
      var pg;
      if (usePackage) pg = package ?? prefix.Config.ccPackage;

      final imageName = getAssetsName(name, pg, userInternational);

      return SvgPicture.asset(imageName,
          key: key,
          matchTextDirection: matchTextDirection,
          bundle: bundle,
          package: pg,
          width: width,
          fit: fit,
          alignment: alignment,
          allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
          placeholderBuilder: placeholderBuilder,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics);
    }

    final f = getAssetsFile(name, userInternational);

    // 展示SDK下载资源
    return SvgPicture.file(f,
        key: key,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        placeholderBuilder: placeholderBuilder,
        color: color,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics);
  }
}

class AiImage {
  static Image asset(
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
    String package,
    FilterQuality filterQuality = FilterQuality.low,
    int cacheWidth,
    int cacheHeight,
    bool usePackage = true, //果如要显示宿主传过来的图片，则不需要设置package，usePackage = false
    bool useLocalAsset = false, // 显示SDK本地包资源
    bool userInternational = false,
  }) {
    if (prefix.config.isApp || useLocalAsset || !gExportAssets) {
      var pg;
      if (usePackage) pg = package ?? prefix.Config.ccPackage;

      final imageName = getAssetsName(name, pg, userInternational);
//      debugPrint('imageName =====> $imageName');
      return Image.asset(imageName,
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
          package: pg,
          filterQuality: filterQuality,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight);
    }

    final f = getAssetsFile(name, userInternational);

    // 展示SDK下载资源
    return Image.file(f,
        key: key,
        scale: scale ?? 1.0,
        frameBuilder: frameBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
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
        filterQuality: filterQuality,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight);
  }

  static ImageProvider assetImage(
    String assetName, {
    AssetBundle bundle,
    String package,
    bool usePackage = true, //果如要显示宿主传过来的图片，则不需要设置package，usePackage = false
    bool useLocalAsset = false, // 显示SDK本地包资源
  }) {
    if (prefix.config.isApp || useLocalAsset || assetName.endsWith('.gif') || !gExportAssets) {
      var pg;
      if (usePackage) pg = package ?? prefix.Config.ccPackage;
      return AssetImage(assetName, bundle: bundle, package: pg);
    }

    // 展示SDK下载资源
    if (Platform.isAndroid) {
      return FileImage(File(AiFile.dir(assetName)));
    }
    return AssetImage(AiFile.dir(assetName), bundle: bundle, package: package);
  }

/* >>>>>>>>>>>>>>>>>>>>>>>> 以上SDK资源加载共用方法，请不要随意修改 <<<<<<<<<<<<<<<<<<<<<<<< */

  /// 默认圆头像
  static String kDefaultHead = 'assets/images/member/img_head_portrait_nor.svg';
  /// 默认方头像
  static String kDefaultHeadS = 'assets/images/member/img_head_portrait_nor_square.svg';
  static Widget fromUrl(String url, String errImg, [BoxFit fit, double width, double height]) {
    // return Container();

    // assert(errImg != 'team');
    // assert(errImg != 'league');
    // assert(errImg != 'head');
    var team = 'assets/images/default/icon_empty_team_home.png';
    var league = 'assets/images/default/league@3x.png';
    var head = kDefaultHead;
    errImg = errImg ?? '';
    fit ??= BoxFit.cover;
    if (!errImg.startsWith('assets/images')) {
      if (errImg == 'team')
        errImg = team;
      else if (errImg == 'league')
        errImg = league;
      else if (errImg == 'head') errImg = head;
    }
    if (isNullOrEmpty(url)) {
      //print('00-fromUrl=$url, errImg=$errImg');
      return (errImg == null || errImg.trim().length == 0)
          ? Container()
          : errImg.endsWith('svg')
              ? AiSvgPicture.asset(errImg, fit: fit)
              : AiImage.asset(errImg, fit: fit);
    }
    if (!url.startsWith("http")) {
      if (url.startsWith('/'))
        url = "${Api.baseImgUrl}$url";
      else
        url = "${Api.baseImgUrl}/$url";
    } else if (url.contains(Api.baseImgUrl)) {
    } else //去掉http开头的，会闪退
    {
      // url = "";
    }

    //print('11-fromUrl=$url, errImg=$errImg');
    return new CachedNetworkImage(
        imageUrl: url,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
        errorWidget: (BuildContext c, String s, Object o) {
          DefaultCacheManager().removeFile(url);
          return (errImg == null || errImg.trim().length == 0)
              ? Container()
              : errImg.endsWith('svg')
                  ? AiSvgPicture.asset(errImg, fit: fit ?? BoxFit.cover, width: width, height: height)
                  : AiImage.asset(errImg, fit: fit ?? BoxFit.cover, width: width, height: height);
        });
  }

  static Widget fromUrlHasSize(String url, String errImg,
      {BoxFit fit = BoxFit.contain,
      double width,
      double height,
      bool useLocalAsset = false,
      BoxFit pFit,
      Size pSize,
      ImageWidgetBuilder imageBuilder}) {
    var team = 'assets/images/default/icon_empty_team_home.png';
    var league = 'assets/images/default/league@3x.png';
    var head = kDefaultHead;
    if (!errImg.startsWith('assets/images')) {
      if (errImg == 'team')
        errImg = team;
      else if (errImg == 'league')
        errImg = league;
      else if (errImg == 'head') errImg = head;
    }
    if (isNullOrEmpty(url)) {
      return (errImg == null || errImg.trim().length == 0)
          ? Container()
          : errImg.endsWith('svg')
              ? AiSvgPicture.asset(errImg, fit: fit, useLocalAsset: useLocalAsset)
              : AiImage.asset(errImg, fit: fit, useLocalAsset: useLocalAsset);
    }
    if (!url.startsWith("http")) {
      if (url.startsWith('/'))
        url = "${Api.baseImgUrl}$url";
      else
        url = "${Api.baseImgUrl}/$url";
    } else if (url.contains(Api.baseImgUrl)) {
    } else //去掉http开头的，会闪退
    {
      // url = "";
    }

    Widget pWidget = errImg.endsWith('svg')
        ? AiSvgPicture.asset(errImg, fit: pFit ?? fit, useLocalAsset: useLocalAsset)
        : AiImage.asset(errImg, fit: pFit ?? fit, useLocalAsset: useLocalAsset);
    if (pFit != null) {
      return CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        imageBuilder: imageBuilder ??
            (BuildContext context, ImageProvider imageProvider) {
              return Image(
                image: imageProvider,
                fit: fit,
              );
            },
        placeholder: (BuildContext context, String url) {
          return pWidget;
        },
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      errorWidget: (BuildContext c, String s, Object o) {
        DefaultCacheManager().removeFile(url);
        return pWidget;
      },
      width: width,
      height: height,
    );
  }

  static Widget fromUrlWithFadeInImage(String url, String errImg, [BoxFit fit = BoxFit.contain]) {
    // return Container();

    // assert(errImg != 'team');
    // assert(errImg != 'league');
    // assert(errImg != 'head');
    var team = 'assets/images/default/icon_empty_team_home.png';
    var league = 'assets/images/default/league@3x.png';
    var head = kDefaultHead;
    if (!errImg.startsWith('assets/images')) {
      if (errImg == 'team')
        errImg = team;
      else if (errImg == 'league')
        errImg = league;
      else if (errImg == 'head') errImg = head;
    }
    if (isNullOrEmpty(url)) {
      return (errImg == null || errImg.trim().length == 0)
          ? Container()
          : errImg.endsWith('svg')
              ? AiSvgPicture.asset(errImg, fit: fit)
              : AiImage.asset(errImg, fit: fit);
    }
    if (!url.startsWith("http")) {
      if (url.startsWith('/'))
        url = "${Api.baseImgUrl}$url";
      else
        url = "${Api.baseImgUrl}/$url";
    } else if (url.contains(Api.baseImgUrl)) {
    } else //去掉http开头的，会闪退
      url = "";
    //print('-----fromUrlWithFadeInImage=$url');

    return new FadeInImage.assetNetwork(
      image: url,
      placeholder: errImg,
      fit: fit,
    );
  }

  ///
  /// 基于XcFadeInImage，XcFadeInImage.assetNetwork支持内存、磁盘、网络的三级缓存功能
  /// needAnimation=false取消过渡动画加快加载速度
  ///
  static Widget fromUrlWithXcFadeInImage(
      String url,
      String errImg,
      {BoxFit fit = BoxFit.contain,
        bool needAnimation = true,
        double width,
        double height,}) {
    var team = 'assets/images/default/icon_empty_team_home.png';
    var league = 'assets/images/default/league@3x.png';
    var head = kDefaultHead;
    if (!errImg.startsWith('assets/images')) {
      if (errImg == 'team')
        errImg = team;
      else if (errImg == 'league')
        errImg = league;
      else if (errImg == 'head') errImg = head;
    }
    if (isNullOrEmpty(url)) {
      return (errImg == null || errImg.trim().length == 0)
          ? Container()
          : errImg.endsWith('svg')
              ? AiSvgPicture.asset(errImg, fit: fit)
              : AiImage.asset(errImg, fit: fit);
    }
    if (!url.startsWith("http")) {
      if (url.startsWith('/'))
        url = "${Api.baseImgUrl}$url";
      else
        url = "${Api.baseImgUrl}/$url";
    } else if (url.contains(Api.baseImgUrl)) {
    } else //去掉http开头的，会闪退
      url = "";
    //print('-----fromUrlWithFadeInImage=$url');

    return new XcFadeInImage.assetNetwork(
      image: url,
      placeholder: errImg,
      fit: fit,
      width: width,
      height: height,
      needAnimation: needAnimation,
    );
  }

  static Widget imgLogo(String img, {double size = 30, double width, double height, BoxFit fit = BoxFit.cover, bool userInternational}) {
    return Container(
        width: width ?? size,
        height: height ?? size,
        //color: Colors.red,
        child: AiImage.asset(
          img,
          fit: fit,
          userInternational: userInternational,
        ));
  }

  static Widget svgLogo(String img, {double size = 30, double width, double height, Color color, bool userInternational = false}) {
    return AiSvgPicture.asset(img, width: width ?? size, height: height ?? size, color: color, userInternational: userInternational);
  }

  static Widget leagueLogo(String leagueLogo, {double size, String defaultLogo, BoxFit fit}) {
    // if(config.userInfo.sportType != 'FT' && config.userInfo.sportType != 'BK')
    //   return Container();

    var logoSize = size ?? prefix.config.skin.game.leagueLogoSizeSmall;
    return Container(
      width: logoSize, height: logoSize,
      //color: Colors.red,
      child: AiImage.fromUrl(leagueLogo, defaultLogo ?? "assets/images/default/league@3x.png", fit),
    );
    // return ClipOval(
    //   child: Container( width: logoSize, height: logoSize,
    //     //color: Colors.red,
    //     child: AiImage.fromUrl(leagueLogo, defaultLogo ?? "assets/images/default/league@3x.png"),
    //   ),
    // );
  }

  static Widget userLogo(String userLogo, {double size, String defaultLogo, fit = BoxFit.cover}) {
    // if(config.userInfo.sportType != 'FT' && config.userInfo.sportType != 'BK')
    //   return Container();
    var userSize = size ?? 35;
    return ClipOval(
      child: SizedBox(
        width: userSize,
        height: userSize,
        child: AiImage.fromUrl(userLogo, defaultLogo ?? "assets/images/member/img_profile_picture_loading.png", fit),
      ),
    );
  }

  static Widget rankingUserLogo(String userLogo, {double size, String defaultLogo}) {
    // if(config.userInfo.sportType != 'FT' && config.userInfo.sportType != 'BK')
    //   return Container();
    var userSize = size ?? 35;
    return ClipOval(
      child: Container(
        width: userSize, height: userSize,
        //color: Colors.red,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          AiImage.asset('assets/images/member/img_profile_picture_loading.png'),
          AiImage.fromUrl(userLogo, defaultLogo ?? "assets/images/member/img_profile_picture_loading.png", BoxFit.cover)
        ]),
      ),
    );
  }

  static Widget teamLogo(
    String teamLogo, {
    // @required
    String teamId,
    double size,
    BoxFit fit = BoxFit.contain,
    bool isHomeTeam,
  }) {
    // if(config.userInfo.sportType != 'FT' && config.userInfo.sportType != 'BK')
    //   return Container();
    String homeLogo = 'icon_empty_team_home.png';
    if (isHomeTeam != null) {
      homeLogo = isHomeTeam ? 'icon_empty_team_home.png' : 'icon_empty_team_away.png';
    }
    var teamSize = size ?? prefix.config.skin.game.teamLogoSize;
    var isFollow = prefix.config.userInfo?.isFollowTeam(teamId) ?? false;
    //isFollow = !isNullOrEmpty(teamId);
    return Container(
      width: teamSize,
      height: teamSize,
      child: Stack(
        clipBehavior: Clip.none, fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: teamSize,
            height: teamSize,
            child: AiImage.fromUrl(teamLogo, "assets/images/default/" + homeLogo, fit),
          ),
          // ClipOval(
          //   child: Container( width: teamSize, height: teamSize,
          //     child: AiImage.fromUrl(teamLogo, "assets/images/default/team@3x.png"),
          //   ),
          // ),
          isFollow
              ? Positioned(
                  bottom: -2,
                  right: -2,
                  child: AiSvgPicture.asset(
                    'assets/images/member/icon_team_mean_normal.svg', // 红心
                    height: 10,
                    width: 10,
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  static Widget sportBackground(String gameType, {BoxFit fit = BoxFit.fitWidth, Alignment alignment = Alignment.bottomCenter}) {
    Widget img;
    if (gameType == "BK") {
      img = AiImage.asset("assets/images/detail/detail_basketball.png", fit: fit, alignment: alignment);
    } else if (gameType == "BS") {
      img = AiImage.asset("assets/images/detail/detail_baseball.png", fit: fit, alignment: alignment);
    } else if (gameType == "OP_DJ") {
      img = AiImage.asset("assets/images/detail/.png", fit: fit, alignment: alignment);
    } else if (gameType == "TN") {
      img = AiImage.asset("assets/images/img_detail_bg/img_detail_bg_tennis.png", fit: fit, alignment: alignment);
    } else if (gameType == "FT") {
      img = AiImage.asset("assets/images/detail/detail_football.png", fit: fit, alignment: alignment);
    } else {
      img = AiImage.asset("assets/images/detail/detail_other_ball.png", fit: fit, alignment: alignment);
    }
    return img;
  }

  static Widget sportLeagueBackground(String gameType, {BoxFit fit = BoxFit.fitWidth, Alignment alignment = Alignment.bottomCenter}) {
    if ((gameType?.length ?? 0) > 0) {
      String leagueBgIcon = AiImageHelper.gameTypeBg(gameType);
      return AiImage.asset(leagueBgIcon, fit: fit, alignment: alignment);
    }
    return AiImage.asset("assets/images/detail/detail_other_ball.png", fit: fit, alignment: alignment);
  }
}
