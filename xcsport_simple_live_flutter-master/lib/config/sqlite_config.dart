import 'dart:convert';

import 'package:fast_ai/utils/logger.dart';
import 'package:flutter/cupertino.dart';
/**********************************************************
 * 创建: south
 * 日期: 2019-10-21
 * 说明  管理sqlite中的配置项的创建查询更新
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/
/*--------------------------------------------------------
 * 创建: south
 * 日期: 2019-10-21
 * 说明：
 * -------------------------------------------------------
 *   版本          修改人           说明
 *  1.0.0.0       south            创建
 **********************************************************/


import 'package:sqflite/sqflite.dart';

import 'sqlite_models/common_config_model.dart';

class SqliteConfig{
  static final ins = new SqliteConfig();
  Database db;
  num version;
  //根据软件的版本创建配置数据库
  open(version)async{
    
     await this.sqlCreate<CommonConfigModel>(keys: ["key"]);

     try{
      this.version = version;
      var databasesPath = await getDatabasesPath();
      String path = "$databasesPath/config.db";
      db = await openDatabase(path, version: version, onCreate: this.createTable );
     }catch(e){
       logError(e);
     }
  }
  close()async{
    try{
      await db.close();
    }catch(e){}
  }

  //根据软件的版本创建 配置数据库的表
  //把版本不一样的表删掉
  createTable (Database db, int version) async {
      //创建通用配置表
      await this.sqlCreate<CommonConfigModel>(keys: ["key"]);
  }

  //创建表
  //表名为T类型名称
  //keys: T类型中作用来作为key的属性
  sqlCreate<T>({
    @required List<String> keys,
    List<T> data
  })async{
    // ClassMirror classMirror = reflectable.reflectType(T);
    // logInfo(classMirror.simpleName);
  }

  //查询数据
  Future<T> sqlSelect<T>({
    Map<String,String> where
  })async{
    return Future.any(null);
  }

  //更新或插入数据
  Future<int> sqlUpdate<T>({
    Map<String,String> sets,
    List<T> data,
    Map<String,String> where
  })async{
    return Future.any(null);
  }

  //删除数据
  Future<T> sqlDelete<T>({
    Map<String,String> where
  })async{
    return Future.any(null);
  }

   //从Sqlite里读取通用配置
   Future<ValueType> getObject<ValueType>(String key)async{
      // var configModel = await this.sqlSelect<CommonConfigModel>(where:{"key":key});
      // return JsonParser().parseJson<ValueType>(configModel.value);
      return null;
   }
   Future<Null> setObject<ValueType>(String key, ValueType value)async{
      var str = jsonEncode(value);
      var configModel = CommonConfigModel(key:key,value:str,version:version);
      await this.sqlUpdate(
        where:{"key":key}, 
        data:<CommonConfigModel>[configModel]
      );
   }
   Future<num> getNum(String key)async{
      var configModel = await this.sqlSelect<CommonConfigModel>(where:{"key":key});
      var ret = num.parse(configModel.value);
      return ret;
   }
   Future<String> getString(String key)async{
      var configModel = await this.sqlSelect<CommonConfigModel>(where:{"key":key});
      var ret = configModel.value;
      return ret;
   }


}

