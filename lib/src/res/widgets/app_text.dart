import 'package:flutter/material.dart';
part 'app_text_sizes.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? size;
  final double? height;
  final FontWeight? weight;
  final int? maxLines;
  final String? family;
  final Color? backgroundColor, decorationColor, color;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? wordSpacing;
  final bool? softWrap;
  final double? letterSpacing;
  final TextBaseline? textBaseline;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final TextDecorationStyle? decorationStyle;

  const AppText(
    this.text, {
    Key? key,
    this.color,
    this.wordSpacing,
    this.family,
    this.size,
    this.weight,
    this.align,
    this.decoration,
    this.backgroundColor,
    this.height,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.letterSpacing,
    this.textBaseline,
    this.onTap,
    this.padding,
    this.decorationStyle,
    this.decorationColor,
  }) : super(key: key);
  factory AppText.small(
    String text, {
    Key? key,
    Color? color,
    String? family,
    double? size,
    FontWeight? weight,
    TextAlign? align,
    TextDecoration? decoration,
    Color? backgroundColor,
    double? height,
    FontStyle? fontStyle,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    double? letterSpacing,
    TextBaseline? textBaseline,
    void Function()? onTap,
    EdgeInsetsGeometry? padding,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
  }) {
    return _SmallAppText(
      text,
      key: key,
      color: color,
      family: family,
      size: size,
      weight: weight,
      align: align,
      decoration: decoration,
      backgroundColor: backgroundColor,
      height: height,
      fontStyle: fontStyle,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      letterSpacing: letterSpacing,
      textBaseline: textBaseline,
      onTap: onTap,
      padding: padding,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
    );
  }

  factory AppText.medium(
    String text, {
    Key? key,
    Color? color,
    String? family,
    double? size,
    FontWeight? weight,
    TextAlign? align,
    TextDecoration? decoration,
    Color? backgroundColor,
    double? height,
    FontStyle? fontStyle,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    double? letterSpacing,
    TextBaseline? textBaseline,
    void Function()? onTap,
    EdgeInsetsGeometry? padding,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
  }) {
    return MediumAppText(
      text,
      key: key,
      color: color,
      family: family,
      size: size,
      weight: weight,
      align: align,
      decoration: decoration,
      backgroundColor: backgroundColor,
      height: height,
      fontStyle: fontStyle,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      letterSpacing: letterSpacing,
      textBaseline: textBaseline,
      onTap: onTap,
      padding: padding,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
    );
  }

  factory AppText.large(
    String text, {
    Key? key,
    Color? color,
    String? family,
    double? size,
    FontWeight? weight,
    TextAlign? align,
    TextDecoration? decoration,
    Color? backgroundColor,
    double? height,
    FontStyle? fontStyle,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    double? letterSpacing,
    TextBaseline? textBaseline,
    void Function()? onTap,
    EdgeInsetsGeometry? padding,
    TextDecorationStyle? decorationStyle,
    Color? decorationColor,
  }) {
    return LargeAppText(
      text,
      key: key,
      color: color,
      family: family,
      size: size,
      weight: weight,
      align: align,
      decoration: decoration,
      backgroundColor: backgroundColor,
      height: height,
      fontStyle: fontStyle,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      letterSpacing: letterSpacing,
      textBaseline: textBaseline,
      onTap: onTap,
      padding: padding,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
    );
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleMedium;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: align,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
          style: TextStyle(
            color: color ?? textTheme?.color ?? color,
            fontSize: size ?? textTheme?.fontSize,
            fontWeight: weight ?? textTheme?.fontWeight,
            decoration: decoration ?? textTheme?.decoration,
            decorationStyle: decorationStyle ?? textTheme?.decorationStyle,
            decorationColor: textTheme?.color ?? decorationColor ?? decorationColor,
            backgroundColor: backgroundColor ?? textTheme?.backgroundColor,
            height: height ?? textTheme?.height,
            wordSpacing: wordSpacing ?? textTheme?.wordSpacing,
            fontFamily: family ?? textTheme?.fontFamily,
            fontStyle: fontStyle ?? textTheme?.fontStyle,
            // overflow: overflow,
            letterSpacing: textTheme?.letterSpacing ?? letterSpacing,
            textBaseline: textTheme?.textBaseline ?? textBaseline,
          ),
        ),
      ),
    );
  }
}
