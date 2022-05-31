import 'package:flutter/material.dart';
import 'package:fast_ai/module/common/package/flutter_common_package.dart';
import 'package:fast_ai/module/common/page/preview_image_page/preview_image_page.dart';
import 'package:fast_ai/module/common/widget/default/default_img_error_widget.dart';
import 'package:fast_ai/module/common/widget/default/default_img_place_widget.dart';

class WXFourNineView extends StatelessWidget {
  final List<String> images;
  final double horizontalPadding;
  final double spacing;
  final double runSpacing;
  final double radius;

  WXFourNineView({
    @required this.images,
    @required this.horizontalPadding,
    spacing,
    runSpacing,
    radius,
  })  : spacing = spacing ?? 10.0,
        runSpacing = runSpacing ?? 10.0,
        radius = radius ?? 12.0;

  @override
  Widget build(BuildContext context) {
    if (images == null) return Container();
    if (images.length == 0) return Container();
    if (images.length == 1) return _buildOneImageView(context, images[0]);
    double totalWidth =
        MediaQuery.of(context).size.width - horizontalPadding - (spacing * 2);
    double itemWidth = totalWidth / 3;
    if (images.length == 2 || images.length == 4)
      return _buildTwoAndFourView(context, itemWidth);

    return _buildNiceView(context, itemWidth);
  }

  Widget _buildOneImageView(BuildContext context, String url) {
    return Align(
      alignment: Alignment.topLeft,
      child: _buildItemView(context, url, 200.0, 0, itemHeight: 200.0),
    );
  }

  Widget _buildTwoAndFourView(BuildContext context, double itemWidth) {
    List<Widget> oneList = [];
    oneList.add(_buildItemView(context, images[0], itemWidth, 0));
    oneList.add(SizedBox(width: spacing));
    oneList.add(_buildItemView(context, images[1], itemWidth, 1));
    List<Widget> twoList = [];
    if (images.length >= 3) {
      twoList.add(_buildItemView(context, images[2], itemWidth, 2));
    }
    if (images.length >= 4) {
      twoList.add(SizedBox(width: spacing));
      twoList.add(_buildItemView(context, images[3], itemWidth, 3));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisSize: MainAxisSize.max, children: oneList),
        if (twoList.length != 0) SizedBox(height: runSpacing),
        if (twoList.length != 0)
          Row(mainAxisSize: MainAxisSize.max, children: twoList),
      ],
    );
  }

  Widget _buildNiceView(BuildContext context, double itemWidth) {
    List<Widget> oneList = [];
    List<Widget> twoList = [];
    List<Widget> threeList = [];

    for (int i = 0; i < images.length; i++) {
      if (i <= 2) {
        oneList.add(_buildItemView(context, images[i], itemWidth, i));
        if (i < 2) oneList.add(SizedBox(width: spacing));
      } else if (i <= 5) {
        twoList.add(_buildItemView(context, images[i], itemWidth, i));
        if (i < 5) twoList.add(SizedBox(width: spacing));
      } else {
        threeList.add(_buildItemView(context, images[i], itemWidth, i));
        if (i < 8) threeList.add(SizedBox(width: spacing));
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisSize: MainAxisSize.max, children: oneList),
        if (twoList.length != 0) SizedBox(height: runSpacing),
        if (twoList.length != 0)
          Row(mainAxisSize: MainAxisSize.max, children: twoList),
        if (threeList.length != 0) SizedBox(height: runSpacing),
        if (threeList.length != 0)
          Row(mainAxisSize: MainAxisSize.max, children: threeList),
      ],
    );
  }

  Widget _buildItemView(
      BuildContext context, String url, double itemWidth, int index,
      {double itemHeight}) {
    return GestureDetector(
      onTap: () {
        double width = MediaQuery.of(context).size.width;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              PreviewImagePage(img: url, album: images, width: width),
        ));
      },
      behavior: HitTestBehavior.translucent,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: SizedBox(
          width: itemWidth,
          height: itemHeight ?? itemWidth,
          child: cmPackageImageCreator.fromUrl(
            url,
            useOldImageOnUrlChange: true,
            placeWidget: DefaultImgPlaceWidget(),
            errorWidget: DefaultImgErrorWidget(),
          ),
        ),
      ),
    );
  }
}
