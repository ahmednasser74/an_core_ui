import 'package:an_core_ui/an_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hint;
  final bool secureText;
  final Color? secureIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;
  final String? labelText;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final void Function(String? v)? onChanged;
  final bool dispose;
  final bool acceptArabicCharOnly;
  final bool acceptNumbersOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool? filled;
  final EdgeInsets? padding;
  final Color? fillColor;
  final double? labelFontSize;
  final TextDirection? textDirection;

  const AppTextFieldWidget({
    Key? key,
    this.controller,
    this.inputType,
    this.prefixIcon,
    this.hint,
    this.secureText = false,
    this.readOnly = false,
    this.acceptArabicCharOnly = false,
    this.acceptNumbersOnly = false,
    this.dispose = true,
    this.suffixIcon,
    this.validator,
    this.labelText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.fontColor = Colors.black,
    this.fontSize,
    this.height,
    this.focusNode,
    this.padding,
    this.autoFocus = false,
    this.filled,
    this.fillColor,
    this.secureIconColor,
    this.labelFontSize,
    this.textDirection,
  }) : super(key: key);

  factory AppTextFieldWidget.email({
    Key? key,
    TextEditingController? controller,
    String? hint,
    String? labelText,
    EdgeInsets? padding,
    Color? fillColor,
    double? labelFontSize,
    AutovalidateMode? autovalidateMode,
    void Function(String? v)? onChanged,
    String? Function(String? v)? validator,
    VoidCallback? onTap,
    FocusNode? focusNode,
    TextDirection? textDirection,
  }) = _AppEmailTextField;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  late bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    passwordVisibility = widget.secureText;
  }

  @override
  Widget build(BuildContext context) {
    final InputDecorationTheme inputDecorationTheme = Theme.of(context).inputDecorationTheme;
    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          margin: widget.padding,
          color: Colors.transparent,
          child: IgnorePointer(
            ignoring: widget.readOnly,
            child: TextFormField(
              style: TextStyle(color: widget.fontColor, fontSize: widget.fontSize, height: 1.4),
              obscureText: passwordVisibility,
              // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              focusNode: widget.focusNode,
              controller: widget.controller,
              validator: widget.validator,
              keyboardType: widget.inputType,
              // readOnly: widget.readOnly,
              onChanged: widget.onChanged,
              autofocus: widget.autoFocus,
              textInputAction: TextInputAction.next,
              maxLines: widget.maxLines,
              autovalidateMode: widget.autovalidateMode,
              inputFormatters: [
                if (widget.acceptArabicCharOnly) FilteringTextInputFormatter.allow(RegExp('^[\u0621-\u064A\u0660-\u0669 ]+\$')),
                if (widget.acceptNumbersOnly) FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: inputDecorationTheme.labelStyle ?? TextStyle(fontSize: widget.labelFontSize),
                hintText: widget.hint,
                border: inputDecorationTheme.border,
                focusedBorder: inputDecorationTheme.focusedBorder,
                enabledBorder: inputDecorationTheme.enabledBorder,
                errorBorder: inputDecorationTheme.errorBorder,
                disabledBorder: inputDecorationTheme.disabledBorder,
                filled: widget.filled == null ? inputDecorationTheme.filled : widget.filled,
                fillColor: widget.fillColor ?? inputDecorationTheme.fillColor,
                contentPadding: inputDecorationTheme.contentPadding,
                errorMaxLines: 2,
                focusColor: inputDecorationTheme.focusColor,
                prefixIcon: widget.prefixIcon,
                suffixIcon: suffixIcon(setState),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget? suffixIcon(setState) {
    if (widget.secureText) {
      return IconButton(
        icon: Icon(
          passwordVisibility ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: widget.secureIconColor ?? Theme.of(context).primaryColor,
        ),
        onPressed: () => setState(() => passwordVisibility = !passwordVisibility),
      );
    }
    return widget.suffixIcon;
  }

  @override
  void dispose() {
    if (widget.controller != null && widget.dispose) {
      widget.controller!.dispose();
    }
    super.dispose();
  }
}

class _AppEmailTextField extends AppTextFieldWidget {
  _AppEmailTextField(
      {Key? key,
      TextEditingController? controller,
      String? hint,
      String? labelText,
      bool readOnly = false,
      bool dispose = true,
      bool autoFocus = false,
      bool filled = false,
      EdgeInsets? padding,
      Color? fillColor,
      double? labelFontSize,
      AutovalidateMode? autovalidateMode,
      void Function(String? v)? onChanged,
      String? Function(String? v)? validator,
      VoidCallback? onTap,
      FocusNode? focusNode,
      TextDirection? textDirection})
      : super(
          key: key,
          controller: controller,
          inputType: TextInputType.emailAddress,
          validator: (v) => v!.emailValidator(),
          hint: labelText == null ? hint ??= 'email'.translate : null,
          labelText: labelText,
          readOnly: readOnly,
          dispose: dispose,
          autoFocus: autoFocus,
          filled: filled,
          padding: padding,
          fillColor: fillColor,
          labelFontSize: labelFontSize,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          onTap: onTap,
          focusNode: focusNode,
        );
}
