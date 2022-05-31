import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:fast_ai/pages/detail/gift/player/gift_play_server.dart';
import 'package:fast_ai/config/config.dart';
import 'dart:typed_data';
import 'package:fast_ai/widgets/imagecache/xc_cache_file_image.dart';
import 'package:flutter/cupertino.dart';


class SvgaGiftPlayer extends StatefulWidget {

  SvgaGiftPlayer();

  @override
  _SvgaGiftPlayerState createState() => _SvgaGiftPlayerState();
}

class _SvgaGiftPlayerState extends State<SvgaGiftPlayer> with TickerProviderStateMixin{

  SVGAAnimationController animationController;
  AnimationController fadeAnimationController;
  GiftPlayChannel svgaChannel;
  CurvedAnimation curve;

  @override
  void initState() {
    this.animationController = SVGAAnimationController(vsync: this);
    fadeAnimationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    curve = CurvedAnimation(parent: fadeAnimationController,curve: Curves.easeOut);
    fadeAnimationController.addStatusListener((status) {
      if(status == AnimationStatus.dismissed){
        stop();
      }
    });


    svgaChannel = GiftPlayServer.ins.getSvgaPlayChannel();
    GiftPlayServer.ins.bindSvgaChannelPlayController(c:GiftPlayController(
        play: play,
        stop: stop
    ));
    super.initState();
  }

  void play(){
    if(mounted){
      setState(() {
        try{
          svgaChannel.giftPlayStatus = GiftPlayStatus.Playing;
          fadeAnimationController.forward(from: 1.0);
          loadAnimation(path: svgaChannel.data.svga);
        } catch(_){
          svgaChannel.giftPlayStatus = GiftPlayStatus.Stopped;
        }
      });
    }
  }

  void stop(){
    if(mounted){
      setState(() {
        svgaChannel.giftPlayStatus = GiftPlayStatus.Stopped;
        animationController.stop();
        this.animationController.videoItem = null;
      });
    }
  }

  @override
  void dispose() {
    this.animationController?.dispose();
    svgaChannel?.giftPlayStatus = GiftPlayStatus.Stopped;
    super.dispose();
  }


  static final XcCacheFileImage _cacheFileImage = XcCacheFileImage();

  void loadAnimation({String path}) async {
    if(path == null && path == "") {
      return;
    }
    var videoItem;
    final Uint8List cacheBytes = await _cacheFileImage.getFileBytes(path);
    if(cacheBytes != null){
      videoItem = await SVGAParser.shared.decodeFromBuffer(cacheBytes.toList());
    } else {
      videoItem = await SVGAParser.shared.decodeFromURL(path);
    }

    this.animationController.videoItem = videoItem;
    this.animationController.reset();
    this.animationController
        .forward()
        .whenComplete(() {
          this.animationController.videoItem = null;
          svgaChannel?.giftPlayStatus = GiftPlayStatus.Stopped;
        });
  }

  @override
  Widget build(BuildContext context) {
    if(svgaChannel?.giftPlayStatus == GiftPlayStatus.Stopped){
      return SizedBox(width: 0,height: 0,);
    }
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 48,
        bottom: MediaQuery.of(context).viewPadding.bottom/2 + 48,
      ),
      child: FadeTransition(
        opacity: curve,
        child: GestureDetector(
          onTap: (){
            if(svgaChannel?.data?.playerId == config?.userInfo?.account?.data?.playerId){
              return;
            }
            fadeAnimationController?.reverse();
          },
          child: Container(
            child: SVGAImage(this.animationController,fit: BoxFit.fitWidth,),
          ),
        ),
      ),
    );
  }
}
