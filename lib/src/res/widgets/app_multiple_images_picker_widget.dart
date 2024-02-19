import 'dart:io';
import 'dart:math';

import 'package:an_core_ui/src/index.dart';
import 'package:an_core_ui/src/res/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../mixin/index.dart';

class AppMultipleImagePickerWidget extends StatefulWidget {
  final void Function(List<String> filesPath) onSelectImage;
  final int maxImages;
  final String? title;

  const AppMultipleImagePickerWidget({
    Key? key,
    required this.onSelectImage,
    this.maxImages = 5,
    this.title,
  }) : super(key: key);

  @override
  State<AppMultipleImagePickerWidget> createState() => _AppMultipleImagePickerWidgetState();
}

class _AppMultipleImagePickerWidgetState extends State<AppMultipleImagePickerWidget> with FileProperties {
  List<String> images = [];
  bool get hasReachedMax => images.length != widget.maxImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: images.map((e) => _imageListWidget(e)).toList(),
        ),
        8.heightBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (images.length == widget.maxImages) _racedMaxSelectedImagesWarning(context),
            if (!hasReachedMax) 12.widthBox,
            Expanded(child: _addPhotosWidget(context)),
          ],
        ),
      ],
    );
  }

  Widget _addPhotosWidget(BuildContext context) {
    return AppButton(
      onTap: () async {
        if (hasReachedMax) {
          final List<String>? pickedImages = await pickedMultipleImages();
          if (pickedImages != null) {
            images.addAll(pickedImages);
            if (images.length > widget.maxImages) images.length = widget.maxImages;
            for (var i = 0; i < images.length; i++) {
              final isFileSizeLowerThan3Mega = await isFileSizeLowerThan(filepath: images[i], maxMegaSize: 2);
              if (!isFileSizeLowerThan3Mega) {
                final compressedFiles = await compressFile(file: File(images[i]));
                images[i] = compressedFiles.path;
              }
            }
            widget.onSelectImage(images);
            setState(() {});
          }
        }
      },
      backgroundColor: hasReachedMax ? Theme.of(context).primaryColor : Colors.grey,
      paddingHorizontal: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: Colors.black, size: 16.sp),
          8.widthBox,
          AppText(widget.title ?? 'addPhotos'.translate, color: Colors.black, size: 12.sp, align: TextAlign.center),
        ],
      ),
    );
  }

  Stack _imageListWidget(String e) {
    return Stack(
      children: [
        AppContainer(
          height: 60.h,
          width: 60.w,
          borderRadius: 6.r,
          marginLeft: 12.w,
          marginTop: 12.h,
          imgType: AppContainerImgType.file,
          image: File(e),
          borderColor: Colors.white,
          fit: BoxFit.fill,
        ),
        PositionedDirectional(
          end: 1,
          child: AppContainer(
            onTap: () {
              setState(() => images.remove(e));
              widget.onSelectImage(images);
            },
            color: Colors.transparent,
            shape: BoxShape.circle,
            height: 12.h,
            width: 12.h,
            child: Icon(Icons.remove_circle_outline_sharp, color: Colors.black, size: 16.r),
          ),
        ),
      ],
    );
  }

  Widget _racedMaxSelectedImagesWarning(BuildContext context) {
    return AppContainer(
      marginVertical: 6.h,
      paddingHorizontal: 8.w,
      paddingVertical: 3.h,
      borderRadius: 4.r,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5.w),
            child: Icon(Icons.auto_awesome, size: 12.sp, color: Colors.black),
          ),
          AppText(
            '${'sorryYouCanNotUploadMoreThan'.translate} ${widget.maxImages} ${'images'.translate}',
            size: 11.sp,
          ),
        ],
      ),
    );
  }
}
