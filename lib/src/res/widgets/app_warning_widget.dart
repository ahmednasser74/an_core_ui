import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWarningWidget extends StatelessWidget {
  const AppWarningWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Theme.of(context).primaryColor,
            size: 150.r,
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
