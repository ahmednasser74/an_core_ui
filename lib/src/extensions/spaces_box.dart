import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacesBox on num {
  Widget get widthBox => SizedBox(
    width: ScreenUtil().setWidth(this is int ? toDouble() : this),
  );

  Widget get heightBox => SizedBox(
    height: ScreenUtil().setHeight(this is int ? toDouble() : this),
  );
}
