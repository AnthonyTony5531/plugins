import 'package:fast_ai/models/base_model.dart';
import 'package:fast_ai/utils/ai_json.dart';

class MerchantConfigDetailModel extends BaseModel{
  String id;
  String merchantId;
  String merchantName;
  String parentName;
  String name;
  String icon;
  String type;
  String url;
  String iosUrl;
  String androidUrl;
  String promoteTitle;
  String promoteContent;
  int createTime;
  int updateBy;
  int updateTime;
  String selfSwitch;
  String platformSwitch;
  bool androidSwitch;
  bool iosSwitch;
  String iosVersion;
  String androidVersion;
  List iosCover;
  List androidCover;

  MerchantConfigDetailModel(
    {this.id='',
      this.merchantId='',
      this.merchantName='',
      this.parentName='',
      this.name='',
      this.icon='',
      this.type='',
      this.url='',
      this.iosUrl='',
      this.androidUrl='',
      this.promoteTitle='',
      this.promoteContent='',
      this.createTime=0,
      this.updateBy=0,
      this.updateTime=0,
      this.selfSwitch='',
      this.platformSwitch='',
      this.androidSwitch=false,
      this.iosSwitch=false,
      this.iosVersion='',
      this.androidVersion='',
      this.iosCover=const [],
      this.androidCover=const [],});

  MerchantConfigDetailModel.fromMap(Map<String, dynamic> json) {
    var map = AiJson(json).getMap('data');

    id = AiJson(map).getString('id');
    merchantId = AiJson(map).getString('merchantId');
    merchantName = AiJson(map).getString('merchantName');
    parentName = AiJson(map).getString('parentName');
    name = AiJson(map).getString('name');
    icon = AiJson(map).getString('icon');
    type = AiJson(map).getString('type');
    url = AiJson(map).getString('url');
    iosUrl = AiJson(map).getString('iosUrl');
    androidUrl = AiJson(map).getString('androidUrl');
    promoteTitle = AiJson(map).getString('promoteTitle');
    promoteContent = AiJson(map).getString('promoteContent');
    createTime = AiJson(map).getTimestamp('createTime');
    updateBy = AiJson(map).getNum('updateBy');
    updateTime = AiJson(map).getNum('updateTime');
    selfSwitch = AiJson(map).getString('selfSwitch');
    platformSwitch = AiJson(map).getString('platformSwitch');
    androidSwitch = AiJson(map).getBool('androidSwitch');
    iosSwitch = AiJson(map).getBool('iosSwitch');
    iosVersion = AiJson(map).getString('iosVersion');
    androidVersion = AiJson(map).getString('androidVersion');
    iosCover = AiJson(map).getArray('iosCover');
    androidCover = AiJson(map).getArray('androidCover');
  }
}