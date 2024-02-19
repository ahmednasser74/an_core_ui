import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHorizontalListBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double? heightList;

  const AppHorizontalListBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.heightList = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightList ?? (heightList! / 100).sh,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
