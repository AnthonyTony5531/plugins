import 'package:common_component/mvvm/view/stateless_view.dart';
import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'default_view_model.dart';
import 'default_style.dart';

///
///
///
class DefaultView extends StatelessView<DefaultStyle, DefaultViewModel> {
  final DefaultViewModel model;

  const DefaultView({Key key, @required this.model})
      : super(key: key, model: model);

  @override
  Widget render(BuildContext context, DefaultViewModel viewModel) {
    return Material(
      color: model.bgColor,
      child: Container(
        alignment: Alignment.center,
        child: model.viewType == DefaultViewType.network
            ? _netDefaultView()
            : _emptyDefaultView(),
      ),
    );
  }

  Widget _netDefaultView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        cmPackage.res.imageCreator
            .assetImage('assets/images/img_empty_wifi.png', width: 140),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.text ?? model.defaultNetworkTxt,
          style: style.txtTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        if (model.showRefreshBtn ?? false)
          InkWell(
            onTap: model.onTap,
            child: Container(
              height: 36,
              padding: EdgeInsets.symmetric(horizontal: 47, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFFF8E70),
                  Color(0xFFFF8BFB),
                ]),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                model.refreshBtnTxt ?? model.defaultRefreshBtnTxt,
                style: style.refreshTxtTextStyle,
              ),
            ),
          )
      ],
    );
  }

  Widget _emptyDefaultView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        cmPackage.res.imageCreator
            .assetImage('assets/images/img_empty_no.png', width: 140),
        const SizedBox(
          height: 10,
        ),
        Text(model.text ?? model.defaultEmptyTxt, style: style.txtTextStyle),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
