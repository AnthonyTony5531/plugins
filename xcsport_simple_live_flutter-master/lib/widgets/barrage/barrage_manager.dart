//**********************************************************************
//* author:Sam
//* date:2020-02-24
//**********************************************************************



import 'barrage_data.dart';




class BarrageManager{

  final List<BarrageData> _list =  [];

  int maxSize = 20;


  int maxCache = 200;

  //内存缓冲区
  final List<BarrageData> _memoryCacheList =  [];


  static final BarrageManager _instance = BarrageManager._();

  BarrageManager._();

  static BarrageManager get()=>_instance;


  void addData(BarrageData shapeData){
    if(!showable)
      return;
    _memoryCacheList.add(shapeData);
    if(_memoryCacheList.length>=maxCache){
      _memoryCacheList.removeAt(0);
    }
  }


  void addRanderData(BarrageData shapeData){
    if(!showable)
      return;
    _list.add(shapeData);
  }

  void addAllRanderData(List<BarrageData> shapeData){
    if(!showable)
      return;
    _list.addAll(shapeData);
  }



  void addAllData(List<BarrageData> data){
    if(!showable)
      return;
    _memoryCacheList.addAll(data);
    if(_memoryCacheList.length>maxCache){
      _memoryCacheList.removeRange(0, _memoryCacheList.length-maxCache);
    }
  }

  //设置最大尺寸
  void setMaxSize(int size){
    maxSize = size;
  }


  bool _showable = true;

  void close(){
    _showable = false;
  }

  void show(){
    _showable = true;
  }

  bool  get showable => _showable;



  void clear(){
    _memoryCacheList.clear();
    _list.clear();
  }

  List<BarrageData> _getList(){
    final  i  = _list.length;
    //保持500数据以下,如果不够maxCacheSize个，到内存去拿
//    if(_memoryCacheList.length>0&& i<maxSize){
//      final int target  = min(maxSize, _memoryCacheList.length);
//      _list.addAll(_memoryCacheList.getRange(0, target));
//      _memoryCacheList.removeRange(0, target);
//    }
    if(i< maxSize&& _memoryCacheList.length>0){
      _list.add(_memoryCacheList.removeAt(0));
    }
    return _list;
  }


  List<BarrageData>  get list  => _getList();

}