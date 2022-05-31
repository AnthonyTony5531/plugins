// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:fast_ai/jsinteraction/xc_url_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  String buildResponseData(String name, String method, String data){
    return  '$name${method.substring(0,1).toUpperCase()}${method.substring(1,method.length)}Callback("${base64Encode(utf8.encode(data))}")';
  }

  group('description', (){
    var parse =  XCUrlParser("xc://webview/action/method?params=阿斯顿发斯蒂芬");
    print(parse.controllerName);
    print(parse.methodName);
    print(parse.params);
    var str  =buildResponseData(parse.controllerName,parse.methodName,parse.params);
    print(str);

  });


  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    
    // config.userInfo.account.data.playerId
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  // });
}
