import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/util/xycolors.dart';
import 'package:fast_ai/module/common/widget/dialog/base_dialog_view.dart';

class LookDeliveryDialog extends BaseDialogView {
  final List<String> deliveryList;
  final VoidCallback callback;
  final ValueChanged<String> onCopyDelivery;

  LookDeliveryDialog({this.deliveryList, this.callback, this.onCopyDelivery});

  @override
  Widget builder(BaseDialogView widget, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LookDeliveryView(
        deliveryList: deliveryList,
        callback: callback,
        onCopyDelivery: onCopyDelivery,
      ),
    );
  }
}

class LookDeliveryView extends StatefulWidget {
  final List<String> deliveryList;
  final VoidCallback callback;
  final ValueChanged<String> onCopyDelivery;
  LookDeliveryView(
      {Key key, this.deliveryList, this.callback, this.onCopyDelivery})
      : super(key: key);

  @override
  _LookDeliveryViewState createState() => _LookDeliveryViewState();
}

class _LookDeliveryViewState extends State<LookDeliveryView> {
  _LookDeliveryDialogStyle dialogStyle = _LookDeliveryDialogStyle();

  List<String> deliveryList;

  @override
  void initState() {
    super.initState();
    deliveryList = widget.deliveryList;
  }

  @override
  Widget build(BuildContext context) {
    String delivery = widget?.deliveryList?.first ?? '';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Center(
        child: Container(
            width: 275.0,
            height: 167.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  child: deliveryList.length > 1
                      ? Container(
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 35.0),
                              itemCount: deliveryList.length,
                              itemBuilder: (BuildContext ctx, int index) {
                                String text = widget.deliveryList[index];
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    widget?.onCopyDelivery?.call(text);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          text,
                                          style: dialogStyle.contentStyle,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10.0),
                                          width: 35.0,
                                          height: 18.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(9.0)),
                                              color: Color(0xFFF5F6FA)),
                                          child: Text(
                                            '复制',
                                            style: dialogStyle.copyStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Center(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              widget?.onCopyDelivery?.call(delivery);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  delivery,
                                  style: dialogStyle.contentStyle,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  width: 35.0,
                                  height: 18.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)),
                                      color: Color(0xFFF5F6FA)),
                                  child: Text(
                                    '复制',
                                    style: dialogStyle.copyStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 1.0,
                  color: Color(0xFFF5F6FA),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text(
                      '关闭',
                      style: dialogStyle.confirmStyle,
                    ),
                  ),
                  onTap: () {
                    if (widget.callback != null) {
                      widget.callback();
                    }
                  },
                )
              ],
            )),
      ),
    );
  }
}

class _LookDeliveryDialogStyle {
  final TextStyle contentStyle = cmPackage.res.textCreator.style(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Color(0xFF333333),
  );

  final TextStyle copyStyle = cmPackage.res.textCreator.style(
    fontSize: 10.0,
    fontWeight: FontWeight.normal,
    color: Color(0xFF333333),
  );

  final TextStyle confirmStyle = cmPackage.res.textCreator.style(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    color: Color(0xFFFF7870),
  );
}
