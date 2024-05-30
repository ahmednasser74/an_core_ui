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
    String? message,
    required Color color,
    TextStyle? titleTextStyle,
    TextStyle? messageTextStyle,
  }) {
    return showFlash(
      barrierDismissible: true,
      context: context,
      persistent: true,
      transitionDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1500),
      builder: (context, controller) {
        return Flash(
          position: FlashPosition.bottom,
          dismissDirections: const [FlashDismissDirection.vertical],
          controller: controller,
          child: Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: AppContainer(
                    paddingTop: 4.h,
                    paddingLeft: 1.w,
                    paddingRight: 1.w,
                    marginBottom: MediaQuery.of(context).padding.bottom,
                    color: color,
                    borderRadius: 24.0,
                    shadowBlurColor: color,
                    child: AppContainer(
                      width: 0.9.sw,
                      paddingHorizontal: 22.w,
                      color: Colors.white,
                      borderRadius: 24.r,
                      shadowBlurColor: Colors.grey,
                      shadowSpreadRadius: 0.5.sp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          8.heightBox,
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
                          if (message != null) 4.heightBox,
                          if (message != null) Divider(color: Colors.grey.shade100, thickness: 1.sp),
                          if (message != null) 4.heightBox,
                          if (message != null)
                            Text(
                              message,
                              style: messageTextStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          4.heightBox,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
    double fontSize = 12,
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
