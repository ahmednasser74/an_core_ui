import 'dart:io';
import 'dart:math';

import 'package:an_core/an_core.dart';
import 'package:an_core_ui/src/extensions/index.dart';
import 'package:an_core_ui/src/helper/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:image/image.dart' as im;
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

mixin FileProperties {
  final List<String> _imageExtensions = ['.apng', '.avif', '.gif', '.jpg', '.jpeg', '.jfif', '.pjpeg', '.pjp', '.png', '.svg', '.webp'];

  Future<File?> pickedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? '');
      return file;
    } else {
      return null;
    }
  }

  Future<({String path, File? file})?> pickedImage({
    required ImageSource source,
    int? imageQuality,
    bool convertToFile = false,
    int? maxMegaSize,
  }) async {
    try {
      final isPermissionGranted = await AppPermissionService.isPickImagePermissionGranted(isForCamera: source == ImageSource.camera);

      if (!isPermissionGranted && !Platform.isIOS) throw Exception('pleaseAllowCameraPermission'.translate);

      final pickedFile = await ImagePicker().pickImage(source: source, imageQuality: imageQuality ?? 50);
      if (pickedFile == null) return null;

      final path = pickedFile.path;

      //* convert image to file
      File? imageAsFile;
      if (convertToFile) imageAsFile = await convertImageToFile(path);

      //* compress image if it's size is bigger than maxMegaSize
      if (maxMegaSize != null) {
        final isFileSizeLowerThan = await this.isFileSizeLowerThan(filepath: path, maxMegaSize: maxMegaSize);
        if (!isFileSizeLowerThan) {
          final compressedFiles = await compressFile(file: imageAsFile ?? File(pickedFile.path));
          return (path: compressedFiles.path, file: compressedFiles);
        }
      }

      return (path: path, file: imageAsFile);
    } catch (e) {
      ToastHelper.showToast(msg: 'pleaseAllowCameraPermission'.translate, backgroundColor: Colors.red, textColor: Colors.white);
      return null;
    }
  }

  Future<bool> isCameraPermissionGranted() async {
    try {
      final isPermissionGranted = await AppPermissionService.isPickImagePermissionGranted(isForCamera: true);
      return isPermissionGranted;
    } catch (e) {
      ToastHelper.showToast(msg: 'pleaseAllowCameraPermission'.translate, backgroundColor: Colors.red, textColor: Colors.white);
      return false;
    }
  }

  Future<List<String>?> pickedMultipleImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage(imageQuality: 50);
    var imagesPath = pickedFiles?.map((image) => image.path).toList();
    if (imagesPath == null) {
      return null;
    }
    return imagesPath;
  }

  Future<String> getFileSize({
    required String filepath,
    required int decimals,
  }) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    final fileSize = '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
    return fileSize;
  }

  Future<bool> isFileSizeLowerThan({required String filepath, required int maxMegaSize}) async {
    const int megaSize = 1048576; //* one mega byte
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes < maxMegaSize * megaSize) {
      return true;
    } else {
      return false;
    }
  }

  Future<File> compressFile({required File file}) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String path = tempDir.path;
      final int rand = math.Random().nextInt(100);
      final im.Image image = im.decodeImage(file.readAsBytesSync())!;
      //final im.Image smallerImage = im.copyResize(image, height: 100); // choose the size here, it will maintain aspect ratio

      final File compressedImage = File('$path/img_$rand.jpg')..writeAsBytesSync(im.encodeJpg(image, quality: 10));
      return compressedImage;
    } catch (e) {
      return file;
    }
  }

  bool fileIsImage({required String fileName}) {
    String extensions = ".${fileName.split('.').last}";
    return _imageExtensions.contains(extensions);
  }

  Future<File> convertImageToFile(String imagePath) async {
    final imageFile = File(imagePath);
    final bytes = await imageFile.readAsBytes();
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/${getFileNameFromImagePath(imagePath)}';
    final tempFile = File(tempPath);
    await tempFile.writeAsBytes(bytes);
    return tempFile;
  }

  String getFileNameFromImagePath(String imagePath) {
    return path.basename(imagePath);
  }
}
