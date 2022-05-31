import 'package:fast_ai/models/base_model.dart';

class DetailRateModel extends BaseModel {
  _DetailRateModel data;

  DetailRateModel();

  DetailRateModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = _DetailRateModel.fromMap(map['data']);
  }
}

class _DetailRateModel {
  dynamic rate, gidm;
  _DetailRateModel.fromMap(Map map) {
    try{
      this.rate = map['detailRate'] == null ? null : map['detailRate']['rate'];
      this.gidm = map['detailRate'] == null ? null : map['detailRate']['gidm'];
    }catch(e){
    }

  }
}
