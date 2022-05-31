import 'dart:async';

import 'package:fast_ai/config/config.dart';
import 'package:fast_ai/event/event.dart';
import 'package:fast_ai/models/matches_detail_model.dart';
import 'package:fast_ai/pages/detail/detail_page.dart';
import 'package:fast_ai/pages/detail/detail_page_model.dart';
import 'package:fast_ai/pages/detail/live_player/video_player_view/base_video_player.dart';
import 'package:fast_ai/pages/detail/live_player/views/live_bottombar/live_bottombar_model.dart';
import 'package:fast_ai/pages/detail/live_player/views/video_player_cache.dart';
import 'package:fast_ai/utils/ai_measure.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/ai_video_player/ai_video_value.dart';
import 'package:fast_ai/widgets/popup_box.dart';
import 'package:fast_ai/widgets/popup_slider_page.dart';
import 'package:flutter/material.dart';

import '../router.dart';
import 'ai_video_player/ai_video_controller.dart';
import 'ai_video_player/ai_video_player_view.dart';

Widget _lastPage;
FloatStatus _floatStatus = FloatStatus.NoDisplay;
OverlayEntry _overlayEntry;
BuildContext _context;
/*
FloatWidget _floatWidget;
_FloatWidgetState _floatWidgetState;
 */
bool _inited = false;
MatchesDetailModel _matchesDetailModel;
String _floatAnchorId;

AiVideoState _videoState = AiVideoState.completed;

BuildContext detailPageGlobalContext;

int detailPageContentHashCode = 0;
String _floatVideoUrl;
AiVideoType _floatVideoFormat;
Size _floatVideoSize;

AiVideoController videoController;
bool _isFreeAnchor = false;

StreamSubscription showFloatVideoStream;

bool needShowFloatVideoWindow = false;

void setFloatVideoInfo({String fvUrl,AiVideoType fvFormat,Size fvSize, bool isFreeAnchor}){
  _floatVideoUrl = fvUrl;
  _floatVideoFormat = fvFormat;
  _floatVideoSize = fvSize;
  _isFreeAnchor = isFreeAnchor ?? false;
  if(showFloatVideoStream == null){
    showFloatVideoStream = Event.eventBus.on<ShowFloatVideo>().listen(_showFloatVideo);
  }
}

void updateFloatMatchesDetail(MatchesDetailModel model){
  if(model == null)return;
  _matchesDetailModel = model;
}

void updateFloatAnchorId(String anchorId){
  if(isStrNullOrEmpty(anchorId))return;
  _floatAnchorId = anchorId;
}

void clearFloatMatchDetail(){
  _matchesDetailModel = null;
  _floatAnchorId = null;
}

FloatStatus getFloatStatus(){
  return _floatStatus;
}


MatchesDetailModel get getFloatMatchesDetail => _matchesDetailModel;

void _showFloatVideo(event){
  //if(videoController == null){
  videoController = AiVideoController();
  //}

  //await sleep(1000);
  _floatStatus = FloatStatus.ShowFloat;
  _overlayEntry = OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) {
        var offset = config.fiexd.floatOffset;
        return  StatefulBuilder(builder: (context, setStater){
          var width = 260.0;
          var height = width * 0.6;
          var vwidth = width - 20;
          var vheight = height - 20;
          return Positioned(
              top: offset.dy,
              left: offset.dx,
              width: width,
              height: height,
              child: Material(
                  color: Color(0x00000000),
                  child:Stack(
                    children: <Widget>[
                      Center(
                          child: Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFFDDDDDD), width: 1),
                              color: Color(0xFF000000),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            width: vwidth,
                            height: vheight,
                            child: ClipRRect(
                              borderRadius : BorderRadius.circular(3),
                              child: isStrNullOrEmpty(_floatVideoUrl) ? SizedBox() : BaseVideoPlayerView(
                                controller: videoController,
                                url: _floatVideoUrl,
                                type: _floatVideoFormat,
                                width: _floatVideoSize.width,
                                height: _floatVideoSize.height,
                              ),
                            ),
                          )
                      ),
                      GestureDetector(
                        onTap: (){
                          showFloatPage2(context,_lastPage,true, FloatOverlay.MatchesCollectedOverlay,(){
                            // 关闭详情,显示小浮窗
                            changeFloatWidget(context);
                          });
                          //showFloatPage(_lastPage,true,FloatOverlay.MatchesCollectedOverlay);
                         // DetailPage.show(context, _lastPage);
                        },
                        onPanUpdate: (details) {
                          setStater((){
                            offset += details.delta;
                            config.fiexd.floatOffset = offset;
                          });
                        },
                        onPanEnd: (details) {
                          double dx = offset.dx;
                          double dy = offset.dy;
                          if(offset.dx < -width/2){
                            closeFloatPage(context);
                            config.fiexd.resetFloatOffset();
                            return;
                          }else if(offset.dx < 0){
                            dx = 0;
                          }
                          if(offset.dx > MediaQuery.of(_context).size.width - width/2){
                            closeFloatPage(context);
                            config.fiexd.resetFloatOffset();
                            return;
                          }else if(offset.dx > MediaQuery.of(_context).size.width - width){
                            dx = MediaQuery.of(_context).size.width - width;
                          }

                          double topOffset = kToolbarHeight + AiMeasure.topOffset(_context) - 20;
                          double bottomOffset = AiMeasure.bottomOffset(_context)-10  + 56+72;
                          if(offset.dy < topOffset){
                            dy = topOffset;
                          }
                          if(offset.dy > MediaQuery.of(_context).size.height - height - bottomOffset){
                            dy = MediaQuery.of(_context).size.height - height - bottomOffset;
                          }
                          setStater((){
                            offset = Offset(dx,dy);
                            config.fiexd.floatOffset = offset;
                          });
                        },
                        child: Container(
                          color: Color(0x01000000),
                        ),
                      ),
                      Align(
                          alignment: Alignment(1, -1),
                          child: InkWell(
                            onTap: (){
                              clearFloatMatchDetail();
                              closeFloatPage(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10, top: 10),
                                width: 25,
                                height: 25,
                                child: Center(child: Icon(Icons.close,color: Colors.white,))
                            ),
                          )
                      )
                    ],
                  )
              )
          );
        });
      });
  Overlay.of(detailPageGlobalContext).insert(_overlayEntry);
  print("************************** changeFloatWidget ********************* 1      detailPageContentHashCode:$detailPageContentHashCode");
}


void disposeFloatVideo(){
  _floatVideoUrl = null;
  _floatVideoFormat = null;
  _floatVideoSize = null;
  _isFreeAnchor = false;
  videoController?.dispose();
  videoController = null;
}

enum FloatStatus{
  NoDisplay,
  ShowPage,
  ShowFloat
}

/* 已废弃
class FloatWidget extends StatefulWidget {
  final Widget child;
  final VideoType videoType;
  FloatWidget({Key key, this.child, @required this.videoType}) : super(key:key);

  @override
  _FloatWidgetState createState() => _FloatWidgetState();
}

class _FloatWidgetState extends State<FloatWidget> {

  @override
  Widget build(BuildContext context) {
    if(_floatWidgetState == this){
       _floatWidget= widget;
    }
    return widget.child;
  }

  @override
  void initState() {
    _floatWidgetState = this;
    super.initState();
  }

  @override
  void dispose() {
    if(_floatWidgetState == this){
      _floatWidgetState = null;
      _floatWidget = null;
    }
    super.dispose();
  }

}
*/

void updateIjkStatus(AiVideoState state){
  _videoState = state;
}


Future showFloatPageSystemRoute(BuildContext context,Widget child,[bool reshow = false])async{

  DetailPage.reshow = reshow;

  initFloatPage();
  if(_overlayEntry != null){
    disposeFloatVideo();
    _overlayEntry.remove();
    _overlayEntry = null;
  }
  _clearData();
  if(_floatStatus == FloatStatus.ShowFloat){
    modifyDetailParams(child);
    clearFloatMatchDetail();
  }
  _floatStatus = FloatStatus.ShowPage;
  _lastPage = child;
//  Navigator.push(context ?? _context, MaterialPageRoute(builder: (BuildContext context){
//    return child;
//  }));
  await showSliderPageSheet(_context ?? context, child, floatOverlay: FloatOverlay.MatchesCollectedOverlay);

}


Future showFloatPage(Widget child,[bool reshow = false,FloatOverlay overlay])async{

  DetailPage.reshow = reshow;

  initFloatPage();
  if(_overlayEntry != null){
    disposeFloatVideo();
    _overlayEntry.remove();
    _overlayEntry = null;

  }
  _clearData();
  if(_floatStatus == FloatStatus.ShowFloat){
    modifyDetailParams(child);
    clearFloatMatchDetail();
  }
  _floatStatus = FloatStatus.ShowPage;
  _lastPage = child;
  await showSliderPageSheet(_context, child, floatOverlay: overlay);


}

Future showFloatPage2(BuildContext context, Widget child,[bool reshow = false,FloatOverlay overlay,VoidCallback onClosing,RouteSettings settings])async{

  DetailPage.reshow = reshow;

  initFloatPage();
  if(_overlayEntry != null){
    disposeFloatVideo();
    _overlayEntry.remove();
    _overlayEntry = null;
  }
  _clearData();
  if(_floatStatus == FloatStatus.ShowFloat){
    modifyDetailParams(child);
    clearFloatMatchDetail();
  }
  _floatStatus = FloatStatus.ShowPage;
  _lastPage = child;
  _context = context;
  await showSliderPageSheet(context, child, floatOverlay: overlay,onClosing: onClosing,settings: settings);
}


Future showFloatPage3(BuildContext context, Widget child,[bool reshow = false,FloatOverlay overlay,RouteSettings settings])async{

  DetailPage.reshow = reshow;

  initFloatPage();
  if(_overlayEntry != null){
    disposeFloatVideo();
    _overlayEntry.remove();
    _overlayEntry = null;
  }
  _clearData();
  if(_floatStatus == FloatStatus.ShowFloat){
    modifyDetailParams(child);
    clearFloatMatchDetail();
  }
  _floatStatus = FloatStatus.ShowPage;
  _lastPage = child;
  _context = context;
  await showSliderPageSheet2(context, child,settings: settings);
}


Future showFloatPageUpdateDetail(BuildContext context, Widget child,[bool reshow = false,FloatOverlay overlay,RouteSettings settings])async{

  DetailPage.reshow = reshow;

  initFloatPage();
  if(_overlayEntry != null){
    disposeFloatVideo();
    _overlayEntry.remove();
    _overlayEntry = null;
  }
  _clearData();
  if(_floatStatus == FloatStatus.ShowFloat){
    modifyDetailParams(child);
    clearFloatMatchDetail();
  }
  _floatStatus = FloatStatus.ShowPage;
  _lastPage = child;
  _context = context;
  var ret = Navigator.of(context).pushReplacement(
        PopupSliderPageRoute(popAnimate: PopAnimate.Fade, child: child, floatOverlay: FloatOverlay.MatchesCollectedOverlay,settings: settings),
      );
  return ret;
}


void modifyDetailParams(Widget dChild){
  if((dChild is DetailPage) && getFloatMatchesDetail != null){
    String anchorId = _floatAnchorId ?? '';
    dChild.params = DetailParams(
      gidm: _matchesDetailModel?.data?.gidm ?? '',
      showtype: _matchesDetailModel?.data?.showtype ?? '',
      anchorId: anchorId,
      type: isStrNullOrEmpty(anchorId) ? '2' : '1',
      playPriority: isStrNullOrEmpty(anchorId) ? PlayPriority.live : PlayPriority.anchor,
    );
  }
}

void initFloatPage(){
  if(_inited)return;
  _inited = true;
  Event.eventBus.on<UnloginEvent>().listen((UnloginEvent ev){
    if(_floatStatus == FloatStatus.ShowFloat){
      closeFloatPage(null);
    }
  });
}

Future closeFloatPage(context)async{
  if(_floatStatus == FloatStatus.ShowPage){
    AiRouter.pop(context ?? _context);
  }else if(_floatStatus == FloatStatus.ShowFloat){
    if(_overlayEntry != null){
      disposeFloatVideo();
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
  _floatStatus = FloatStatus.NoDisplay;
  _clearData();
}


Future updateFloatContext(BuildContext context)async{
  _context = context;
}


Future gCloseFloat() async {
  if(_overlayEntry != null) {
    disposeFloatVideo();
    _overlayEntry.remove();
    _floatStatus = FloatStatus.NoDisplay;
    _clearData();

    await sleep(200);
  }
}


_clearData(){
  _overlayEntry = null;
  /*
  _floatWidget = null;
  _floatWidgetState = null;
   */
  _videoState = AiVideoState.idle;
}

bool changeFloatWidgetOnly(){
  if(_floatStatus == FloatStatus.ShowFloat){
    _floatStatus = FloatStatus.ShowPage;
    showFloatPage(_lastPage,true);
    return true;
  }
  return false;
}

Future changeFloatWidget(BuildContext context) async{
  print('_floatStatus=$_floatStatus, _videoState=$_videoState, VideoPlayerCache.floatVideoAble=${VideoPlayerCache.floatVideoAble} _floatVideoFormat=$_floatVideoFormat');
  if(_floatStatus == FloatStatus.ShowPage
      && _floatVideoFormat == AiVideoType.video
      /*
      && _floatWidget != null
      && _floatWidget.videoType == VideoType.Video
      */
      && _videoState == AiVideoState.started
      && VideoPlayerCache.floatVideoAble) {
    if(config.userInfo.isNoAllowWatchLive || _isFreeAnchor){
      needShowFloatVideoWindow = false;
      clearFloatMatchDetail();
    }else{
      needShowFloatVideoWindow = true;
    }
    print("************************** changeFloatWidget ********************* 0      detailPageContentHashCode:$detailPageContentHashCode");
    AiRouter.pop(context);
    print("#************************** changeFloatWidget ********************* 2      detailPageContentHashCode:$detailPageContentHashCode");
  }else if(_floatStatus == FloatStatus.ShowPage){
    closeFloatPage(context);
  }else if(_floatStatus == FloatStatus.ShowFloat){
    _floatStatus = FloatStatus.ShowPage;
    showFloatPage2(_context,_lastPage,true, FloatOverlay.MatchesCollectedOverlay);
  }
  else if(_floatStatus == FloatStatus.NoDisplay){
    clearFloatMatchDetail();
    AiRouter.pop(context);
  }
}

