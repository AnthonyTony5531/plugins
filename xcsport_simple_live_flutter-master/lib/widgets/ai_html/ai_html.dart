library flutter_html;

import 'package:flutter/material.dart';

import 'ai_rich_text_parser.dart';

class AiHtml extends StatelessWidget {
  AiHtml({
    Key key,
    @required this.data,
    this.padding,
    this.backgroundColor,
    this.defaultTextStyle,
    this.onLinkTap,
    this.renderNewlines = false,
    this.customRender,
    this.customEdgeInsets,
    this.customTextStyle,
    this.customTextAlign,
    this.blockSpacing = 14.0,
    this.onImageError,
    this.linkStyle = const TextStyle(
        decoration: TextDecoration.underline,
        color: Colors.blueAccent,
        decorationColor: Colors.blueAccent),
    this.shrinkToFit = false,
    this.onImageTap,
    this.showImages = true,
    this.onParseImgUrl
  }) : super(key: key);

  final String data;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final TextStyle defaultTextStyle;
  final OnLinkTap onLinkTap;
  final bool renderNewlines;
  final double blockSpacing;
  final ImageErrorListener onImageError;
  final String Function(String url) onParseImgUrl;
  final TextStyle linkStyle;
  final bool shrinkToFit;

  /// Properties for the Image widget that gets rendered by the rich text parser
  final OnImageTap onImageTap;
  final bool showImages;

  /// Either return a custom widget for specific node types or return null to
  /// fallback to the default rendering.
  final CustomRender customRender;
  final CustomEdgeInsets customEdgeInsets;
  final CustomTextStyle customTextStyle;
  final CustomTextAlign customTextAlign;

  @override
  Widget build(BuildContext context) {
    final double width = shrinkToFit ? null : MediaQuery.of(context).size.width;

    return Container(
      padding: padding,
      color: backgroundColor,
      width: width,
      child: DefaultTextStyle.merge(
        style: defaultTextStyle ?? DefaultTextStyle.of(context).style,
        child: AiHtmlRichTextParser(
          shrinkToFit: shrinkToFit,
          onLinkTap: onLinkTap,
          renderNewlines: renderNewlines,
          customEdgeInsets: customEdgeInsets,
          customTextStyle: customTextStyle,
          customTextAlign: customTextAlign,
          html: data,
          onImageError: onImageError,
          linkStyle: linkStyle,
          onImageTap: onImageTap,
          showImages: showImages,
          onParserImgUrl: onParseImgUrl,
        )
      ),
    );
  }
}
