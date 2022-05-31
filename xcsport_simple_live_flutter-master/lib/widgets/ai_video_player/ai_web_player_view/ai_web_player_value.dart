enum AiWebPlayState { idle, initialized, asyncPreparing, prepared, started, paused, completed, stopped, error, end }

class AiWebPlayerValue {
  AiWebPlayState _state;
  int _code;
  String _errorMsg;  
  /// 拓展信息 默认为空
  Map<String, dynamic> _params;

  AiWebPlayState get state => _state ?? AiWebPlayState.idle;

  int get code => _code ?? 0;

  String get errorMsg => _errorMsg ?? '';

  bool get isError => code != 0;

  Map<String, dynamic> get params => _params ?? {};

  AiWebPlayerValue() {
    this._state = AiWebPlayState.idle;
    this._code = 0;
    this._errorMsg = '';
    this._params = {};
  }


  AiWebPlayerValue.state(AiWebPlayState state,{int code,String msg, Map<String, dynamic> params}){
    this._state = state;
    this._code = code ?? (state == AiWebPlayState.error ? -1 : 0);
    this._errorMsg = msg ?? '';
    this._params = params;
  }

}
