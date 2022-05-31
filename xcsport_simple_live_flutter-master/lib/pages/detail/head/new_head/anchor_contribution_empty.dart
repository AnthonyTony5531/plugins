import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/default_views/default_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnchorContributionEmpty extends StatelessWidget {

  final String name;
  final double height;
  final bool isShowEmptyBtn;
  final VoidCallback onRefresh;
  AnchorContributionEmpty({
    this.name,
    this.height,
    this.isShowEmptyBtn = false,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultView(
        backgroundColor: Colors.white,
        name: isNullOrEmpty(name) ? 'anchor_contribution_empty' : name,
        height: this.height,
        enableBtn: this.isShowEmptyBtn,
        onTap: (){
          if(onRefresh != null){
            onRefresh();
          }
        }
    );
  }
}
