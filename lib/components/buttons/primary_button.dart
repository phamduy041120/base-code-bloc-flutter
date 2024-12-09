import 'package:flutter/material.dart';

import '../../resources/gen/colors.gen.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.child,
    super.key,
    this.enable = true,
    this.onPressed,
    this.enableColor = _defaultEnableColor,
    this.disableColor = _defaultDisableColor,
    this.fillColor,
    this.foregroundColor,
    this.elevation,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 1,
  });

  final bool enable;

  final Widget child;

  final Function()? onPressed;

  final Color enableColor;

  final Color disableColor;

  final Color? borderColor;

  final Color? fillColor;

  final Color? foregroundColor;

  final double? elevation;

  final double borderWidth;

  final BorderRadiusGeometry? borderRadius;

  static const _defaultEnableColor = ColorName.blue;

  static const _defaultDisableColor = ColorName.grayCCCCCC;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 46,
        child: TextButton(
          onPressed: enable ? onPressed : null,
          style: TextButton.styleFrom(
            backgroundColor: enable == true
                ? fillColor ?? enableColor
                : fillColor ?? disableColor,
            foregroundColor: foregroundColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              side: BorderSide(
                width: borderWidth,
                color:
                    enable == true ? borderColor ?? enableColor : disableColor,
              ),
            ),
          ),
          child: child,
        ),
      );
}
