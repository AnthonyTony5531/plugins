import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/models/base_model.dart';

class PlayGroupModel extends BaseModel {
  _PlayGroupItemModel data;

  PlayGroupModel();

  PlayGroupModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.data = _PlayGroupItemModel.fromMap(map['data']);
  }
}

class _PlayGroupItemModel {
  List<PlayModel> novice;
  List<PlayModel> veteran;

  _PlayGroupItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.novice =
        map['novice'] == null ? null : map['novice'].map<PlayModel>((item) => PlayModel.fromMap(item)).toList();
    this.veteran =
        map['veteran'] == null ? null : map['veteran'].map<PlayModel>((item) => PlayModel.fromMap(item)).toList();
  }
}

class PlayModel {
  PlayModel();
  String id;
  String name;
  List<dynamic> playData;
  PlayModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return;
    this.id = map['id'];
    this.name = map['name'];
    if (config.isTwLang) {
      this.name = config.langConfig.transToTwText(cnString: this.name);
    }
    this.playData = map['playData'];
  }
}
