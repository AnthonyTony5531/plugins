import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui show Image;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/cupertino.dart';

class ImageUtil {

  static ImageStreamListener _listener;
  ///
  /// 获取图片信息
  static Future<ui.Image> getImageInfo(String path) async {
    Completer<ui.Image> completer = Completer();
    Image srcImage = Image.file(File.fromUri(Uri.parse(path)));
    var stream = srcImage.image.resolve(ImageConfiguration());
    _listener = ImageStreamListener((image,_){

      completer.complete(image.image);
      stream.removeListener(_listener);
    },onError: (dynamic exception, StackTrace stackTrace){
      completer.complete(null);
      stream.removeListener(_listener);
    });
    stream.addListener(_listener);

    return completer.future;
  }

  ///
  /// 压缩图片
  ///
  static Future<String> zipImage(String path) async {
    final dir = await path_provider.getTemporaryDirectory();
    String tempPath = path.substring(path.lastIndexOf("/"));
    File newFile = File(dir.path + tempPath);
    if(!newFile.existsSync()){
      newFile.createSync(recursive: true);
    }

    File scrFile = File(path);
    ui.Image imageInfo = await getImageInfo(path);
    final result = await FlutterImageCompress.compressWithFile(
      scrFile.absolute.path,
      minWidth: imageInfo.width * 50,
      minHeight: imageInfo.height * 50,
      quality: 80,
      rotate: 0,
    );

    var completer = Completer<String>();
    newFile.writeAsBytes(result).then((value) => {
      completer.complete(newFile.path)
    }).catchError((_){
      completer.complete(null);
    });

    return completer.future;
  }

  static bool delImageFile(String path){
    File file = File(path);
    if(file.existsSync()){
      file.delete();
    }
    return true;
  }


}