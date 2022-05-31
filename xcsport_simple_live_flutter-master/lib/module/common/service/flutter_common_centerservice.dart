import 'package:common_component/mvvm/model/service/service.dart';
import 'package:fast_ai/module/common/service/connectivity_service.dart';
import 'package:fast_ai/module/common/service/file_resource_service.dart';

class FlutterCommonCenterService extends IService {
  FileResourceService fileResService = FileResourceService();
  ConnectivityService connectivityService = ConnectivityService();
  @override
  String get name => 'flutter_wallet';

  @override
  Future<void> init() async {
    await super.init();
    await fileResService.init();
    await connectivityService.init();
  }
}
