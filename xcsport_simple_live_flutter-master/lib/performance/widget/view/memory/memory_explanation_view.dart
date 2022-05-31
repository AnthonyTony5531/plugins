import 'package:flutter/material.dart';

class MemoryExplanationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14.0, color: Color(0xff333333), height: 1.5),
          children: <TextSpan>[
            TextSpan(text: '1.Memory State info'),
            TextSpan(text: '\nIsolateName : 隔离内存名称', style: const TextStyle(fontSize: 12.0, color: Color(0xff666666))),
            TextSpan(text: '\nHeapUsage : 堆栈使用', style: const TextStyle(fontSize: 12.0, color: Color(0xff666666))),
            TextSpan(text: '\nHeapCapacity : 堆栈容量', style: const TextStyle(fontSize: 12.0, color: Color(0xff666666))),
            TextSpan(text: '\nExternalUsage : 外部使用', style: const TextStyle(fontSize: 12.0, color: Color(0xff666666))),
            TextSpan(text: '\n2.GC : 手动触发内存回收'),
            TextSpan(
                text: '\n3.查看某个State类在手动GC之后仍存在,判定为泄漏;但查看非State类时手动GC之后不存在!只说明该类被释放!',
                style: const TextStyle(fontSize: 14.0, color: Color(0xFFE57373), height: 1.5)),
            TextSpan(
                text: '\neg:自定义继承ChangeNotifier,并设有监听;触发GC之后,该类被置空释放!实则内部listener并未释放!正确做法需调用dispose or removeListener',
                style: const TextStyle(fontSize: 14.0, color: Color(0xFFE57373), height: 1.5)),
            TextSpan(text: '\n4.泄漏暂时无法提供泄漏点和链,需要人为去排除;'),
            TextSpan(text: '\n5.GC和刷新,点击频率500ms/次'),
            TextSpan(text: '\nPS:GC过程可能会卡顿,正常现象!'),
          ],
        ),
      ),
    );
  }
}
