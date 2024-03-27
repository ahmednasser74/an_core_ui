import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import '../enum/language.dart';

extension NavExtension on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedReplacement(String routeName, {Object? arguments}) async {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushRoute(Route route) async {
    Navigator.of(this).push(route);
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) async {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName) async {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void pop([result]) async => Navigator.of(this).pop(result);

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}

extension GlobalExtension on BuildContext {
  void dismissKeyboard() => FocusScope.of(this).requestFocus(FocusNode());
}

extension LanguageContextExtension on BuildContext {
  Language get getLanguage => Language.values.firstWhere((element) => element.value == locale.toString());

  bool get languageIsAr => locale.toString() == Language.ar.value;

  bool get languageIsEn => locale.toString() == Language.en.value;

  TextDirection get textDirection => languageIsAr ? TextDirection.rtl : TextDirection.ltr;

  void updateLanguage(Language language) {
    if (language == Language.ar) {
      setLocale(Locale(Language.ar.value));
      return;
    }
    setLocale(Locale(Language.en.value));
  }
}
