import 'package:an_core_ui/an_core_ui.dart';
import 'package:flutter/material.dart';

class DatePickerFieldWidget extends StatefulWidget {
  const DatePickerFieldWidget({
    super.key,
    required this.dateCallBack,
    required this.label,
    this.initDate,
  });
  final void Function(DateTime) dateCallBack;
  final String label;
  final DateTime? initDate;

  @override
  State<DatePickerFieldWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DatePickerFieldWidget> {
  final TextEditingController _dateController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    if (widget.initDate != null) {
      _dateController.text = widget.initDate!.toBirthDateForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      controller: _dateController,
      suffixIcon: Icon(
        Icons.calendar_month_outlined,
        color: context.primaryColor,
        size: 20.sp,
      ),
      readOnly: true,
      dispose: false,
      fontSize: 14.sp,
      labelFontSize: 12.sp,
      validator: (v) => v!.notLessThan(minNumToValidate: 1),
      labelText: widget.label,
      onTap: () => AppDateTimePicker.datePicker(
        context,
        (date) {
          if (date == null) return;
          widget.dateCallBack(date);
          _dateController.text = date.toBirthDateForm(language: context.getLanguage);
        },
        initialDate: DateTime(DateTime.now().year - 18),
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 18),
      ),
    );
  }
}
