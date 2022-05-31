
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FileUtil{

  static Future<File> createFile(String path) async {
    File file = File(path);
    if(! await file.exists()){
      await file.create(recursive: true);
    }
    return file;
  }

  static Future<bool> deleteFile(File file) async {
    try{
      if(await file?.exists()){
        await file.delete();
      }
      return true;
    }catch(_){
      return false;
    }
  }

  static Future<bool> delFile(String path) async {
    try{
      File file = File(path);
      if(! await file.exists()){
        return true;
      }
      return deleteFile(file);
    }catch(_){
      return false;
    }
  }

  ///
  /// 删除过期的文件
  /// @expiredDays 过期天数，超过该天数的删除
  static void delExpiredLogFile({@required String dirPath,int days = 1,int minutes = 0,int second = 0}) async {
    Directory(dirPath).list(recursive: true).listen((FileSystemEntity event){
      event.stat().then((stat)  {
        if(stat.changed.add(Duration(days: days,minutes: minutes, seconds: second)).millisecondsSinceEpoch < DateTime.now().millisecondsSinceEpoch){
          delFile(event.path);
        }
      });
    });
  }

  ///
  ///
  static Future<IOSink> openFile(FileMode mode, String filePath)async{
    IOSink ioSink;
    try{
      File file = await createFile(filePath);
      ioSink = file.openWrite(mode: mode);
    } catch(_){
      ioSink?.close();
      ioSink = null;
    }
    return ioSink;
  }

  ///
  static void createDir(String path){

  }

  ///
  static void deleteDir(String dir){
    Directory(dir).exists().then((rst){
      if(rst){
        Directory(dir).delete(recursive: true);
      }
    });
  }

  static Future<dynamic> localJson(String fileName) async {
    String filePath = 'assets/files/$fileName.json';
    var jsonString = await rootBundle.loadString(filePath);
    var jsonMap = jsonDecode(jsonString);
    //print('000-$fileName.json jsonMap=$jsonMap');
    return jsonMap;//.cast<String, dynamic>();
  }


}