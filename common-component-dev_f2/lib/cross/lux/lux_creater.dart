import 'package:common_component/mvvm/viewmodel/viewmodel.dart';
import 'package:common_component/util/listeners/value_listener.dart';
import 'package:common_component/util/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './lux.dart';
import 'lux_creaters.dart';
import 'lux_enums.dart';

abstract class LuxCreater {
  String get lux;

  bool get isWidget => false;

  dynamic create(BuildContext context, Map script);

  Map get sample;

  static Future init() async {
    await Lux.ins.init();
    registerEnums(lux_enums);
    register(lux_creaters);
  }

  static void register(List<LuxCreater> creaters) {
    Lux.ins.register(creaters);
  }

  static void registerEnums(Map enums) {
    Lux.ins.registerEnums(enums);
  }

  static Color parseColor(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var c = int.parse("$value");
      return Color(c);
    } catch (e) {
      logger.info('LuxCreater',"parseColor $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static bool parseBool(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var v = "$value";
      return v == "true";
    } catch (e) {
      logger.info('LuxCreater', "parseBool $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static double parseDouble(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var v = "$value";
      if (v == "double.infinity") return double.infinity;
      return double.parse(v);
    } catch (e) {
      logger.info('LuxCreater',"parseDouble $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static int parseInt(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var v = "$value";
      return int.parse(v);
    } catch (e) {
      logger.info('LuxCreater',"parseDouble $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static EdgeInsetsGeometry parseEdgeInsets(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return EdgeInsets.only(
        left: parseDouble(value, "left") ?? 0.0,
        right: parseDouble(value, "right") ?? 0.0,
        top: parseDouble(value, "top") ?? 0.0,
        bottom: parseDouble(value, "bottom") ?? 0.0,
      );
    } catch (e) {
      logger.info('LuxCreater',"parsePadding $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static dynamic parseEnum(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return Lux.ins.getEnum("$value");
    } catch (e) {
      logger.info('LuxCreater',"parseEnum $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static String parseString(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return "$value";
    } catch (e) {
      logger.info('LuxCreater',"parseEnum $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static Map<String, String> parseMapString(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var ret = Map<String, String>();
      if (value is Map) {
        value.forEach((k, v) {
          ret.addAll({"$k": "$v"});
        });
      }
      return ret;
    } catch (e) {
      logger.info('LuxCreater',"parseMapString $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static int parseInteger(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var v = "$value";
      return int.parse(v);
    } catch (e) {
      logger.info('LuxCreater',"parseInteger $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  /// 仅限String,num,默认返回dynamic
  static List<T> parseList<T>(dynamic value, String attrName) {
    var list = value[attrName];
    if (list == null) return [];
    Lux.ins.pushPath(attrName);
    try {
      if (T is String) {
        return (list as List)?.map((value) => value.toString())?.toList() ?? [];
      } else if (T is num) {
        return (list as List)?.map((value) => num.parse(value))?.toList() ?? [];
      } else {
        return list;
      }
    } catch (e) {
      logger.info('LuxCreater',"parseList $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  //static parseRect
  static dynamic parseRect(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return Rect.fromLTWH(
        parseDouble(value, "left"),
        parseDouble(value, "top"),
        parseDouble(value, "width"),
        parseDouble(value, "height"),
      );
    } catch (e) {
      logger.info('LuxCreater',"parseRect $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static Border parseBorder(Map value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return Border(
          bottom: parseBorderSide(value, "bottom"),
          top: parseBorderSide(value, "top"),
          left: parseBorderSide(value, "left"),
          right: parseBorderSide(value, "right"));
    } catch (e) {
      logger.info('LuxCreater',"parseRect $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static BorderSide parseBorderSide(Map value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return BorderSide(
        color: parseColor(value, "color") ?? const Color(0xFF000000),
        width: parseDouble(value, "width") ?? 1.0,
        style: parseEnum(value, "style") ?? BorderStyle.solid,
      );
    } catch (e) {
      logger.info('LuxCreater',"parseBorderSide $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static BorderRadiusGeometry parseBorderRadius(Map value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return BorderRadius.only(
        topLeft: Radius.circular(parseDouble(value, "topLeft") ?? 0.0),
        topRight: Radius.circular(parseDouble(value, "topRight") ?? 0.0),
        bottomLeft: Radius.circular(parseDouble(value, "bottomLeft") ?? 0.0),
        bottomRight: Radius.circular(parseDouble(value, "bottomRight") ?? 0.0),
      );
    } catch (e) {
      logger.info('LuxCreater',"parseBorderRadius $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static TextStyle parseTextStyle(Map value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return TextStyle(
        color: parseColor(value, 'color'),
        fontSize: parseDouble(value, 'fontSize'),
        fontWeight: parseEnum(value, 'fontWeight'),
      );
    } catch (e) {
      logger.info('LuxCreater',"parseBorderRadius $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static ValueListener createListener(dynamic value, String attrName) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return Lux.ins.createListener("$attrName=$value");
    } catch (e) {
      logger.info('LuxCreater',"createListener $value, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static void fire(dynamic value, String attrName, [dynamic args]) {
    value = value[attrName];
    if (value == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      Lux.ins.fire("$value", args);
    } catch (e) {
      logger.info('LuxCreater',"emit $value, ${Lux.ins.currentPath} error: $e");
    } finally {
      Lux.ins.popPath();
    }
  }

  static dynamic createIns(BuildContext context, Map script, [String attrName]) {
    if (script == null) return null;
    if (attrName == null) {
      return Lux.ins.createIns(context, script);
    } else {
      Lux.ins.pushPath(attrName);
      try {
        return Lux.ins.createIns(context, script[attrName]);
      } finally {
        Lux.ins.popPath();
      }
    }
  }

  static List<T> createInsList<T>(BuildContext context, Map script, [String attrName]) {
    if (script == null) return null;
    if (attrName == null) {
      return Lux.ins.createInsList<T>(context, script);
    } else {
      Lux.ins.pushPath(attrName);
      try {
        return Lux.ins.createInsList<T>(context, script[attrName]);
      } finally {
        Lux.ins.popPath();
      }
    }
  }

  static dynamic parseMatrix4(dynamic value, String attrName) {
    var item = value[attrName];
    if (item == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var list = item as List;
      return Matrix4(
        list[0],
        list[1],
        list[2],
        list[3],
        list[4],
        list[5],
        list[6],
        list[7],
        list[8],
        list[9],
        list[10],
        list[11],
        list[12],
        list[13],
        list[14],
        list[15],
      );
    } catch (e) {
      logger.info('LuxCreater',"parseMatrix4 $item, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static dynamic parseExistObj(Map value, String attrName) {
    var item = value[attrName];
    if (item == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      return item;
    } catch (e) {
      logger.info('LuxCreater',"parseExistObj $item, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static IViewModel parseModel(Map value, String attrName) {
    var item = value[attrName];
    if (item == null) return null;
    Lux.ins.pushPath(attrName);
    try {
      var modelId = '${item["id"]}';
      IViewModel model;
      if (modelId == null) {
        model = Lux.ins.createIns(null, item);
      } else {
        model = Lux.ins.getModel(modelId);
        if (model == null) {
          model = Lux.ins.createIns(null, item);
          if (model != null) Lux.ins.setModel(modelId, model);
        }
      }
      return model;
    } catch (e) {
      logger.info('LuxCreater',"parseModel $item, ${Lux.ins.currentPath} error: $e");
      return null;
    } finally {
      Lux.ins.popPath();
    }
  }

  static IViewModel getModel(String name) {
    return Lux.ins.getModel(name);
  }

  static ValueListener getListener(String name) {
    return Lux.ins.getListener(name);
  }

  static void removeListener(String name) {
    return Lux.ins.removeListener(name);
  }
}
