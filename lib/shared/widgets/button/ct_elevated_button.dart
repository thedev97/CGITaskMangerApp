import 'package:flutter/material.dart';
import 'package:cgi_task_v1/shared/widgets/button/base_button.dart';

class CGITaskElevatedButton extends CGITaskBaseButton {
  const CGITaskElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.isLeftIconNeed,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
  });

  final BoxDecoration? decoration;
  final bool? isLeftIconNeed;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 50.0,
        width: width ?? double.infinity,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              leftIcon ?? Container(),
              SizedBox(width: leftIcon != null ? 8 : 0),
              Padding(
                padding: EdgeInsets.only(top: leftIcon != null ? 2 : 0),
                child: Text(
                  text,
                  style: buttonTextStyle,
                ),
              ),
              rightIcon ?? Container(),
            ],
          ),
        ),
      );
}
