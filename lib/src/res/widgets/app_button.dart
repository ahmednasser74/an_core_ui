import 'package:an_core_ui/src/res/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text, fontFamily;
  final Alignment alignment;
  final double elevation, paddingHorizontal, paddingVertical, marginHorizontal, marginVertical;
  final double? borderRadius, fonSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final Size? minimumSize;
  final TextAlign? textAlign;
  const AppButton({
    Key? key,
    required this.onTap,
    this.text,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.elevation = 0,
    this.child,
    this.paddingHorizontal = 16,
    this.paddingVertical = 8,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.textColor,
    this.fonSize,
    this.fontFamily,
    this.borderColor,
    this.borderRadius,
    this.fontWeight,
    this.minimumSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textButtonTheme.style?.textStyle?.resolve({MaterialState.selected});
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
        vertical: marginVertical,
      ),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          minimumSize: minimumSize,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          elevation: elevation,
          alignment: alignment,
          // textStyle: buttonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10.r)),
          ),
        ),
        child: child ??
            AppText(
              text ?? '',
              size: fonSize ?? buttonTextStyle?.fontSize,
              color: textColor ?? buttonTextStyle?.color ?? Colors.black,
              family: fontFamily ?? buttonTextStyle?.fontFamily,
              weight: fontWeight ?? buttonTextStyle?.fontWeight,
              height: 1.2,
              align: textAlign,
            ),
      ),
    );
  }
}
