import 'package:flutter/material.dart';

import '../../index.dart';

// ignore: must_be_immutable
class AppCheckboxWithTextWidget extends StatefulWidget {
  AppCheckboxWithTextWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
    this.onTapText,
  }) : super(key: key);

  final Function(bool) onChanged;
  final VoidCallback? onTapText;
  bool value;
  final String? title;

  @override
  State<AppCheckboxWithTextWidget> createState() => _AppCheckboxWithTextWidgetState();
}

class _AppCheckboxWithTextWidgetState extends State<AppCheckboxWithTextWidget> {
  @override
  Widget build(BuildContext context) {
    // this for removing changeable status onTap from text in case need to tap on text
    if (widget.onTapText == null) {
      return StatefulBuilder(
        builder: (context, setState) {
          return InkWell(
            onTap: () {
              widget.value = !widget.value;
              widget.onChanged(widget.value);
              setState(() {});
            },
            child: _checkBox(),
          );
        },
      );
    }
    return _checkBox();
  }

  Widget _checkBox() {
    final checkboxTheme = Theme.of(context).checkboxTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
          child: Checkbox(
            value: widget.value,
            activeColor: checkboxTheme.fillColor?.resolve({MaterialState.selected}) ?? Theme.of(context).primaryColor,
            onChanged: (newValue) {
              widget.value = !widget.value;
              widget.onChanged(widget.value);
              setState(() {});
            },
          ),
        ),
        if (widget.title != null)
          Expanded(
            child: InkWell(
              onTap: widget.onTapText,
              child: AppText(widget.title ?? ''),
            ),
          ),
      ],
    );
  }
}
