import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    Key? key,
    required this.title,
    required this.value,
    this.fontSize = 14.0,
    this.titleFontSize,
    this.valueFontSize,
    this.titleColor,
    this.valueColor,
    this.titleFontFamily,
    this.valueDecoration,
    this.titleWeight,
    this.valueWeight,
  }) : super(key: key);
  final String title, value;
  final double? fontSize, titleFontSize, valueFontSize;
  final Color? titleColor, valueColor;
  final String? titleFontFamily;
  final TextDecoration? valueDecoration;
  final FontWeight? titleWeight, valueWeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: titleColor,
          fontFamily: theme.textTheme.bodyMedium?.fontFamily ?? titleFontFamily,
          fontSize: titleFontSize ?? fontSize,
          fontWeight: titleWeight,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor,
              fontSize: valueFontSize ?? fontSize,
              fontFamily: theme.textTheme.bodyMedium?.fontFamily ?? titleFontFamily,
              overflow: TextOverflow.ellipsis,
              decoration: valueDecoration,
              fontWeight: valueWeight,
            ),
          ),
        ],
      ),
    );
  }
}
