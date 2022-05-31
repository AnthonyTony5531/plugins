import 'package:fast_ai/performance/manager/performance_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// @author grey
/// Function :

class SaveWidgetView extends StatelessWidget {
  final String value;

  SaveWidgetView({this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => copyData(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(3.0)),
        ),
        child: Text(
          '复制数据',
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ),
    );
  }

  void copyData() {
    Clipboard.setData(ClipboardData(text: value)).then((value) {
      PerformanceManager.instance.showOverlayToast('复制成功');
    });
  }

  void saveChild() async {
    // if (_isSaving) return;
    // _isSaving = true;
    // final isHasStorage = await PermissionTool.requestFilePermission();
    // if (isHasStorage) {
    //   BuildContext buildContext = childKey.currentContext;
    //   if (null != buildContext) {
    //     RenderRepaintBoundary boundary = buildContext.findRenderObject();
    //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    //     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    //     Uint8List _uInt8List = byteData.buffer.asUint8List();
    //     String name = '${tag}_widget_${DateTime.now().millisecondsSinceEpoch}';
    //     final result = await ImageGallerySaver.saveImage(_uInt8List, name: name);
    //     debugPrint(result);
    //   }
    // } else {
    //   debugPrint('暂无权限');
    // }
    // _isSaving = false;
  }
}
