import 'package:flutter/material.dart';

class CGITaskIconButton extends StatelessWidget {
  const CGITaskIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  });

  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => IconButton(
    padding: EdgeInsets.zero,
    icon: Container(
      height: height ?? 30,
      width: width ?? 30,
      padding: padding ?? EdgeInsets.zero,
      decoration: decoration ??
          BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
      child: child,
    ),
    onPressed: onTap,
  );
}
