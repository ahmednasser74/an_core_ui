import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../index.dart';

class BaseMyApp extends StatelessWidget {
  const BaseMyApp({
    Key? key,
    required this.materialApp,
    required this.localizationFilePath,
    this.supportedLocales,
    this.fallbackLocale,
    this.startLocale,
  }) : super(key: key);

  final Widget materialApp;
  final String localizationFilePath;
  final List<Locale>? supportedLocales;
  final Locale? fallbackLocale;
  final Locale? startLocale;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/langs',
      saveLocale: true,
      supportedLocales: supportedLocales ?? [Locale(Language.ar.value), Locale(Language.en.value)],
      fallbackLocale: fallbackLocale ?? Locale(Language.en.value),
      startLocale: startLocale ?? Locale(Language.en.value),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) => materialApp,
      ),
    );
  }
}
