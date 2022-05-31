import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef InputOnTapCallback = Future<bool> Function();

class SearchBarView extends StatefulWidget {
  final Widget searchBack;
  final Widget searchIcon;
  final Widget cleanIcon;
  final bool enabled;
  final String hint;
  final TextStyle hintStyle;
  final TextStyle style;
  final Color backgroundColor;
  final String btnName;
  final TextStyle btnStyle;
  final VoidCallback onReturnCallBack;
  final ValueChanged<String> onSearchCallBack;
  final InputOnTapCallback onClick;

  SearchBarView({
    Key key,
    this.searchBack,
    this.searchIcon,
    this.cleanIcon,
    this.hint,
    this.hintStyle,
    this.style,
    this.btnName,
    this.btnStyle,
    this.onReturnCallBack,
    this.onSearchCallBack,
    this.onClick,
    enabled,
    backgroundColor,
  })  : enabled = enabled ?? false,
        backgroundColor = backgroundColor ?? Colors.white,
        super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  StreamController<bool> _cleanStream = StreamController<bool>.broadcast();
  Timer _inputShowTimer;

  @override
  void dispose() {
    _searchController?.dispose();
    _searchFocus?.dispose();
    _cleanStream?.close();
    _inputShowTimer?.cancel();
    _inputShowTimer = null;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SearchBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled && !widget.enabled) {
      _searchController.clear();
      _searchFocus.unfocus();
      _cleanStream.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildReturnBtn(context),
          _buildSearchView(),
          if (widget.enabled) const SizedBox(width: 10.0),
          if (widget.enabled) _buildSearchBtn(),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }

  Widget _buildReturnBtn(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: kToolbarHeight,
        height: kToolbarHeight,
        child: Center(
          child: widget.searchBack ?? Icon(Icons.arrow_back_ios, size: 18.0, color: Color(0xff333333)),
        ),
      ),
      onTap: () {
        if (widget.onReturnCallBack == null) {
          Navigator.of(context).pop();
        } else {
          if (_searchFocus.hasFocus) _searchFocus?.unfocus();
          _searchController.clear();
          widget.onReturnCallBack?.call();
        }
      },
    );
  }

  Widget _buildSearchView() {
    return Expanded(
      child: SizedBox(
        height: 34.0,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                height: 34.0,
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF5F6FA),
                  borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 16.0, maxHeight: 34.0),
                      child: widget.searchIcon ?? Icon(Icons.search, size: 16.0, color: Color(0xff999999)),
                    ),
                    SizedBox(width: 6.0),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        maxLines: 1,
                        minLines: 1,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        style: widget.style ?? const TextStyle(color: Color(0xff333333), fontSize: 14.0),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                          hintText: widget.hint ?? '',
                          hintStyle: widget.hintStyle ?? const TextStyle(color: Color(0xff999999), fontSize: 14.0),
                          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedErrorBorder:
                              const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (s) => _onSubmitCallBack(),
                        onChanged: (s) {
                          final state = (s != null && s.length != 0);
                          _cleanStream.add(state);
                        },
                        enabled: widget.enabled,
                      ),
                    ),
                    _buildCleanBtn(),
                  ],
                ),
              ),
            ),
            if (!widget.enabled)
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    widget.onClick?.call()?.then((value) {
                      if (value) _inputShowKeyboard();
                    });
                  },
                  child: SizedBox.expand(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCleanBtn() {
    return StreamBuilder<bool>(
      initialData: false,
      stream: _cleanStream.stream,
      builder: (cxt, span) {
        return Visibility(
          visible: span?.data ?? false,
          child: GestureDetector(
            onTap: () {
              _searchController.clear();
              _cleanStream.add(false);
              widget.onSearchCallBack?.call('');
            },
            child: Container(
              margin: EdgeInsets.only(left: 6.0),
              height: 34.0,
              child: Center(
                child: widget.cleanIcon ?? Icon(Icons.cancel, color: Color(0xffcdcdcd), size: 16.0),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBtn() {
    return GestureDetector(
      onTap: () => _onSubmitCallBack(),
      child: SizedBox(
        height: 34.0,
        child: Center(
          child: Text(
            widget.btnName ?? '搜索',
            style: widget.btnStyle ?? const TextStyle(color: Color(0xffFF7870), fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  void _onSubmitCallBack() {
    _searchFocus.unfocus();
    final value = _searchController.value.text;
    widget.onSearchCallBack?.call(value);
  }

  void _inputShowKeyboard() {
    _inputShowTimer?.cancel();
    _inputShowTimer = null;
    _inputShowTimer = Timer(Duration(milliseconds: 300), () {
      _searchFocus.requestFocus();
    });
  }
}
