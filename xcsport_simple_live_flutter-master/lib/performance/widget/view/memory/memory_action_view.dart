import 'package:fast_ai/performance/bean/memory_kit.dart';
import 'package:fast_ai/performance/widget/behavior/hide_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryActionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoryActionViewState();
}

class _MemoryActionViewState extends State<MemoryActionView> {
  final String spClassName = 'performance_memory_action_class_names';

  TextEditingController _txtCT;
  FocusNode _focusNode;
  SharedPreferences _preferences;
  List<String> _classList = [];
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    _txtCT = TextEditingController();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      initData();
    });
  }

  @override
  void dispose() {
    _preferences.setStringList(spClassName, _classList);
    _txtCT?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 12.0),
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
                      maxLines: 1,
                      onSubmitted: (value) => addClassName(),
                      style: const TextStyle(color: Color(0xff333333), fontSize: 14.0),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xff666666), fontSize: 14.0),
                        hintText: '输入class name (不带空格)',
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => addClassName(),
                  child: const SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Icon(Icons.subdirectory_arrow_right, color: Color(0xff333333), size: 24.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Class Name 筛选List',
              style: const TextStyle(color: Color(0xff333333), fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: HideScrollBehavior(),
              child: ListView.builder(
                itemCount: _classList.length,
                itemExtent: 50.0,
                itemBuilder: (cxt, index) {
                  final className = _classList[index];
                  bool isSelect = MemoryKit.selClassNames.contains(className);
                  return ClassItemView(
                    className: className,
                    index: index,
                    isSelect: isSelect,
                    onClickTap: (value) {
                      if (MemoryKit.selClassNames.contains(value)) {
                        MemoryKit.selClassNames.remove(value);
                      } else {
                        MemoryKit.selClassNames.add(value);
                      }
                      _uploadData();
                    },
                    onDeleteTap: (value) {
                      _classList.remove(value);
                      _uploadData();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initData() async {
    _preferences = await SharedPreferences.getInstance();
    _classList.addAll(_preferences.getStringList(spClassName) ?? []);
    setState(() {});
  }

  void addClassName() async {
    if (!_isComplete) {
      final className = _txtCT.value.text.toLowerCase().trim();
      if (className == '') return;
      if (_classList.contains(className)) return;

      _isComplete = true;
      _focusNode.unfocus();

      _classList.add(className);
      MemoryKit.selClassNames.add(className);
      _txtCT.text = '';
      await Future.delayed(Duration(milliseconds: 300));
      _isComplete = false;
      _uploadData();
    }
  }

  void _uploadData() {
    if (mounted) setState(() {});
  }
}

class ClassItemView extends StatelessWidget {
  final String className;
  final int index;
  final bool isSelect;
  final Function(String) onDeleteTap;
  final Function(String) onClickTap;

  ClassItemView({this.className, this.index, this.isSelect, this.onClickTap, this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 1 ? const Color(0xfffafafa) : Colors.white,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(className, style: const TextStyle(color: Color(0xff333333), fontSize: 14.0)),
            ),
          ),
          GestureDetector(
            onTap: () => onClickTap?.call(className),
            child: SizedBox.fromSize(
              size: Size(50.0, 50.0),
              child: Icon(
                isSelect ? Icons.check_circle : Icons.check_circle_outline,
                color: isSelect ? Colors.red.shade300 : Colors.grey,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onDeleteTap?.call(className),
            child: SizedBox.fromSize(
              size: Size(50.0, 50.0),
              child: Icon(
                Icons.delete_sweep,
                color: Colors.indigoAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
