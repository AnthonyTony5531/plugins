import 'package:fast_ai/utils/ai_json.dart';

class GameNotifyMessage {
  String _gameKey;
  String _table;
  String _url;
  String _tableId;
  num _roadType;
  num _pushType;

  String _supplierId = '';
  String _gameType = '';
  String _title = '';
  String _tableName = '';
  String _webUrl = '';

  String _listItemName = '';

  GameNotifyMessage();

  GameNotifyMessage.json(dynamic jsonData) {
    AiJson aiJson = AiJson(jsonData);
    List list = aiJson.getArray('data');
    if (list != null && list.length >= 1) {
      aiJson = AiJson(list.first);
      this._gameKey = aiJson.getString('gameKey', defaultValue: '');
      this._table = aiJson.getString('tableName', defaultValue: '');
      this._tableId = aiJson.getString('tableId', defaultValue: '');
      this._roadType = aiJson.getNum('roadType', defaultValue: 0);
      this._url = aiJson.getString('url', defaultValue: '');
      this._pushType = aiJson.getNum('pushType', defaultValue: 0);
    }
  }

  String get gameKey => _gameKey ?? '';

  String get gameType => _gameType;

  String get title => _title;

  String get table => _table;

  String get tableId => _tableId;

  String get tableName => _tableName;

  String get webUrl => _webUrl;

  String get supplierId => _supplierId;

  String get listItemName => _listItemName;

  // 是否正常数据
  bool get isTrue {
    bool isA = _gameKey != null && _gameKey.trim().isNotEmpty;
    bool isB = _pushType > 0 && _pushType <= 5;
    return isA && isB;
  }

  // pushTypeEnum:{1:长龙,2:单跳,3:A房B房,4:排排坐,5:三角}
  String get pushTypeName {
    switch (_pushType) {
      case 1:
        return '长龙';
      case 2:
        return '单跳';
      case 3:
        return 'A房B房';
      case 4:
        return '排排坐';
      case 5:
        return '三角';
      default:
        return '';
    }
  }

  String get roadTpyeName {
    switch (_roadType) {
      case 1:
        return '大路';
      case 2:
        return '大眼仔路';
      case 3:
        return '小路';
      case 4:
        return '蟑螂路';
      default:
        return '';
    }
  }

  void setDialogInfo(String gameName, String supplierId, String gameType) {
    _title = '出现$roadTpyeName$pushTypeName';
    _tableName = '$gameName$_table桌';
    _webUrl = this._url ?? '';
    _listItemName = '$gameName$_table桌出现$roadTpyeName$pushTypeName!';
    _supplierId = supplierId ?? '';
    _gameType = gameType ?? '';
  }
}
