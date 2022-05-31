import 'dart:io';

const aarDir = '../build/host/outputs/repo';

Future main() async {
  output(Directory(aarDir));
}

void output(Directory dir) async {
  if (dir.existsSync()) {
    List<FileSystemEntity> files = dir.listSync();
    for (FileSystemEntity entity in files) {
      if(FileSystemEntity.isFileSync(entity.path)){
        if(entity.path.endsWith('.aar')&& entity.path.contains('release-')){
          var file = File.fromUri(Uri.parse(entity.path));
          var fileName = file.path.substring(file.path.lastIndexOf('/')+1, file.path.length);
          var outputFile = new File("../../AiSportSDKSample_Android/fastailib/libs/$fileName");
          file.copySync(outputFile.path);
        }
        if(entity.path.endsWith('.aar')&& entity.path.contains('release-')){
          var file = File.fromUri(Uri.parse(entity.path));
          var fileName = file.path.substring(file.path.lastIndexOf('/')+1, file.path.length);
          var outputFile = new File("../../gbet_sdk_android_sample/fastailib/libs/$fileName");
          file.copySync(outputFile.path);
        }
      }else if(FileSystemEntity.isDirectorySync(entity.path)){
         output(Directory.fromUri(Uri.parse(entity.path)));
      }
    }
  }
}
