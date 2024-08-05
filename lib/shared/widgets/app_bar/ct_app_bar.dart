import 'package:flutter/material.dart';

class CGITaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CGITaskAppBar({
    super.key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.width,
    this.isDefaultStyle,
    this.automaticallyImplyLeading
  });

  final double? height;
  final double? width;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool? isDefaultStyle;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      toolbarHeight: height ?? kToolbarHeight,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      flexibleSpace: isDefaultStyle == true ? _getDefaultStyle() : _getStyle(),
      leadingWidth: leadingWidth ?? 40,
      leading: leading,
      title: title,
      titleSpacing: kRadialReactionRadius,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size(width ?? double.infinity, height ?? kToolbarHeight);

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return const SizedBox(
          height: kToolbarHeight,
          width: double.infinity,
        );
      default:
        return null;
    }
  }

  Widget? _getDefaultStyle() {
    switch (styleType) {
      case Style.bgFill:
        return const SizedBox(
          height: 0,
          width: double.infinity,
        );
      default:
        return null;
    }
  }
}

enum Style { bgFill }
