import 'package:fast_ai/utils/ai_image.dart';
import 'package:fast_ai/widgets/image/ai_gif_image.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/migrate_plugins/xcpageslider/page_slider_container.dart';

class TestMemoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestMemoryPageState();
}

class _TestMemoryPageState extends State<TestMemoryPage> {
  var pageSliderController = PageSliderController();

  AiGifImageController gifController = new AiGifImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('内存泄漏各种测试!')),
      body: Container(
        child: Container(
          width: 60,
          height: 50,
          child: AiGifImage(
            fetchCompletedPlay: true,
            path: 'assets/images/bet/share/chat_room_follow_bet.gif',
            max: 20,
            controller: gifController,
            duration: 2000,
            userInternational: false,
            playCompleteCallback: (complected) {
              if (mounted && complected) {
                setState(() {
                  gifController.repeat();
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
