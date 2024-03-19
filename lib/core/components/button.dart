import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'spaces.dart';

enum ButtonStyle {
  primary,
  outlined,
}

class Button extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;

  const Button.primary({
    super.key,
    required this.onPressed,
    required this.child,
    this.style = ButtonStyle.primary,
    this.color = AppColor.primary,
    this.textColor = AppColor.black,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 12.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 14.0,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.child,
    this.style = ButtonStyle.outlined,
    this.color = AppColor.white,
    this.textColor = AppColor.black,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 12.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.primary
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SpaceWidth(10.0),
                  child
                ],
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: color,
                side: const BorderSide(color: AppColor.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SpaceWidth(10.0),
                  child
                ],
              ),
            ),
    );
  }
}
