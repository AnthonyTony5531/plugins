import 'dart:async';
import 'package:fast_ai/widgets/imagecache/xc_network_image.dart' as xcNetworkImage;
import 'package:fast_ai/pages/detail/gift/gift_model.dart';
import 'package:fast_ai/api/protocols/detail/gift_query_protocol.dart';
import 'package:dio/dio.dart';
import 'package:fast_ai/utils/string_util.dart';
import 'dart:convert' as _convert;
import 'package:fast_ai/utils/ai_cache.dart';


///
/// 礼物数据与图片资源提前缓存与加载
///
class GiftResPreloadServer{

  GiftResPreloadServer._();

  static GiftResPreloadServer ins = GiftResPreloadServer._();

  var _tasks = <GiftResPreloadTask>[];

  Timer _engine;

  bool _running = false;

  final int retryDelayTime = 2000;
  final int maxRetryCount = 5;

  ///
  void start({GiftResPreloadTask task}) async {
    if(task != null){
      _tasks?.add(task);
    }

    if(_engine == null){
      _engine = Timer.periodic(Duration(milliseconds: 100),(timer){
        if(_tasks.isNotEmpty && !_running ){
          //print("imagecache engin running start");
          var task = _tasks.first;
          if((task.retryDateTime == null ||  DateTime.now().millisecondsSinceEpoch > task.retryDateTime) && !_running){
            _tasks.remove(task);
            _doTask(task);
          }
        } else if(_tasks.isEmpty){
          _engine?.cancel();
          _engine = null;
        }
      });
    }
  }

  ///
  void addTask({GiftResPreloadTask task}){
    if(task != null){
      _tasks?.add(task);
    }
  }

  void _doTask(GiftResPreloadTask task) async {
    _running = true;
    CancelToken cancelToken = CancelToken();
    try{
      var model = GiftModel();
      GiftQueryReqProtocol req = GiftQueryReqProtocol();
      var result = await req.request(cancelToken: cancelToken);

      if(result.code == 200){
        String json = _convert.jsonEncode(result.giftList);
        //var r = GiftQueryRspProtocol.fromList(_convert.jsonDecode(json));
        AiCache.get().setString(AiCache.GIFT_REQ_DATA, json);
      }
      model.fromGiftRspProtocol(result);

      model?.giftList?.forEach((gift) async {
        if(isNotEmpty(gift.giftImage)) {
          await xcNetworkImage.NetworkImage(gift.giftImage).preLoad();
        }
        if(isNotEmpty(gift.pngImage)){
          await xcNetworkImage.NetworkImage(gift.pngImage).preLoad();
        }
      });
      _running = false;
      //print("imagecache engin running stop");
    } catch(e){
      //if(task.retryCount < maxRetryCount){
      //  task.retryCount += 1;
      //  task.retryDateTime = DateTime.now().millisecondsSinceEpoch + retryDelayTime * task.retryCount;
      //  _tasks.add(task);
      //}
      _running = false;
      //print("imagecache $e    retryCount:${task.retryCount}");
      cancelToken?.cancel();
    }
  }




}

///
/// 礼物资源预加载信息
class GiftResPreloadTask{

  final String tag;

  int retryCount = 0;

  int retryDateTime;

  GiftResPreloadTask({this.tag});
}