import 'package:flutter/material.dart';

/// @author grey
/// Function :

class BorderButtonView extends StatelessWidget {
  final String text;
  final String hint;
  final double maxWidth;
  final double maxHeight;
  final Color borderColor;
  final double borderRadius;
  final bool isSelect;
  final Widget icon;
  final VoidCallback onClick;
  final VoidCallback onLongClick;

  BorderButtonView(
    this.text, {
    this.hint,
    this.onClick,
    this.onLongClick,
    this.borderColor,
    this.borderRadius,
    this.maxWidth,
    this.maxHeight,
    this.icon,
    this.isSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick?.call(),
      onLongPress: () => onLongClick?.call(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? 120.0),
        child: Container(
          height: maxHeight ?? 32.0,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: isSelect ? Colors.red.shade300 : (borderColor ?? Colors.blue), width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 2.0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  text ?? (hint ?? ''),
                  style: const TextStyle(color: Color(0xff333333), fontSize: 12.0),
                ),
              ),
              const SizedBox(width: 2.0),
              if (onLongClick != null && text != null) icon ?? const Icon(Icons.delete_forever, color: Colors.grey, size: 14.0),
            ],
          ),
        ),
      ),
    );
  }
}
