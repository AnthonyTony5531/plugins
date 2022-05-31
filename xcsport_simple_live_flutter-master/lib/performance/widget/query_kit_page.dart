import 'dart:collection';

import 'package:fast_ai/performance/bean/query_kit.dart';
import 'package:fast_ai/performance/manager/common_kit_manager.dart';
import 'package:flutter/material.dart';

/// @author grey
/// Function :

final Queue<String> _queryHistoryList = Queue<String>();

class QueryKitPage extends StatefulWidget {
  @override
  _QueryKitPageState createState() => _QueryKitPageState();
}

class _QueryKitPageState extends State<QueryKitPage> {
  TextEditingController _txtCT;
  FocusNode _focusNode;

  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    if (QueryKit.queryStr != null && QueryKit.queryStr.length != 0) {
      _txtCT = TextEditingController.fromValue(
        TextEditingValue(
          text: QueryKit.queryStr,
          selection: TextSelection.fromPosition(
            TextPosition(
              affinity: TextAffinity.downstream,
              offset: QueryKit.queryStr.length,
            ),
          ),
        ),
      );
    } else {
      _txtCT = TextEditingController();
    }
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _txtCT?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isHasHistory = _queryHistoryList.length != 0;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 0.8),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: _txtCT,
                      focusNode: _focusNode,
                      autofocus: true,
                      onSubmitted: (value) => filterAllocations(),
                      style: const TextStyle(color: Color(0xff333333), fontSize: 14.0),
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintStyle: TextStyle(color: Color(0xff333333), fontSize: 14.0), hintText: '输入过滤条件'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => filterAllocations(),
                  child: const SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Icon(Icons.search, color: Colors.grey, size: 24.0),
                  ),
                ),
              ],
            ),
          ),
          if (isHasHistory)
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                '历史记录',
                style: const TextStyle(color: Color(0xff333333), fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          if (isHasHistory) _buildHistoryListView(),
        ],
      ),
    );
  }

  Widget _buildHistoryListView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _queryHistoryList.map((value) {
        return GestureDetector(
          onTap: () {
            if (!_isComplete) {
              QueryKit.queryStr = value;
              CommonKitManager.instance.getKit(CommonKitRouter.KIT_QUERY).quitAction();
            }
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffefefef), width: 1.0)),
            ),
            child: Text(
              value,
              style: TextStyle(color: Color(0xff333333), fontSize: 14.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }

  void filterAllocations() async {
    if (!_isComplete) {
      _isComplete = true;
      _focusNode.unfocus();
      QueryKit.queryStr = _txtCT.value.text;
      // 缓存历史查询记录
      if (_queryHistoryList.length >= 10) _queryHistoryList.removeLast();
      _queryHistoryList.addFirst(QueryKit.queryStr);
      await Future.delayed(Duration(milliseconds: 300));
      CommonKitManager.instance.getKit(CommonKitRouter.KIT_QUERY).quitAction();
    }
  }
}
