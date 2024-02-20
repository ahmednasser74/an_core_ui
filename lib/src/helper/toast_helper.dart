import 'package:an_core_ui/src/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../res/index.dart';

class ToastHelper {
  static Future<Object?> showCustomToast({
    required BuildContext context,
    required String title,
    required String message,
    required Color color,
    TextStyle? titleTextStyle,
    TextStyle? messageTextStyle,
  }) {
    return showFlash(
      barrierDismissible: true,
      context: context,
      persistent: true,
      transitionDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash(
          position: FlashPosition.bottom,
          dismissDirections: const [FlashDismissDirection.vertical],
          controller: controller,
          child: Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Material(
              type: MaterialType.transparency,
              child: AppContainer(
                paddingTop: 10,
                marginBottom: 2.h,
                marginLeft: 1.w,
                marginRight: 1.w,
                color: color,
                borderRadius: 24.0,
                shadowBlurColor: color,
                child: AppContainer(
                  width: 0.9.sw,
                  marginHorizontal: 5.w,
                  marginVertical: 5.h,
                  color: Colors.white,
                  borderRadius: 24.r,
                  shadowBlurColor: Colors.grey,
                  shadowSpreadRadius: 0.5.sp,
                  paddingHorizontal: 5.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(title, style: titleTextStyle),
                          const Spacer(),
                          AppContainer(
                            onTap: () => controller.dismiss(),
                            marginHorizontal: 1.w,
                            marginVertical: 1.h,
                            child: Icon(
                              Icons.clear,
                              color: Colors.grey.shade300,
                              size: 4.w,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey.shade100, thickness: 1.sp),
                      Text(
                        message,
                        style: messageTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      2.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showToast({
    required String msg,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast toastLength = Toast.LENGTH_SHORT,
    Color? backgroundColor,
    Color textColor = Colors.white,
    double fontSize = 16,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
