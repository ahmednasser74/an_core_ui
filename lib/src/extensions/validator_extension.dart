import 'package:an_core_ui/src/extensions/index.dart';

extension PhoneValidatorExtension on String {
  String? phoneValidator({int? minLength, int? maxLength}) {
    if (isEmpty) {
      return 'thisFieldIsRequired'.translate;
    } else if ((minLength != null && length < minLength) || (maxLength != null && length > maxLength)) {
      return 'enterValidFormat'.translate;
    }
    return null;
  }
}

extension PasswordValidatorExtension on String {
  String? passwordValidator({bool? withRegex}) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'passwordIsRequired'.translate;
    } else if (length < 8) {
      return 'atLeast8Characters'.translate;
    } else if (withRegex != null && !regExp.hasMatch(this)) {
      return 'passwordMustContain'.translate;
    }
    return null;
  }

  String? isConfirmPasswordMatched(String password) {
    if (isEmpty) {
      return 'thisFieldIsRequired'.translate;
    } else if (length < 8) {
      return 'atLeast8Characters'.translate;
    } else if (password.trim() != trim()) {
      return 'passwordConfirmationNotMatchedWithPassword'.translate;
    }
    return null;
  }
}

extension StringValidationExtension on String {
  String? nameValidator() {
    if (isEmpty) {
      return 'thisFieldIsRequired'.translate;
    } else if (length <= 3) {
      return 'atLeast3Characters'.translate;
    }
    return null;
  }

  String? notLessThan({required int minNumToValidate}) {
    if (isEmpty) {
      return 'thisFieldIsRequired'.translate;
    } else if (length < minNumToValidate) {
      return '${'atLeast'.translate} $minNumToValidate ${'character'.translate}';
    }
    return null;
  }

  String? onlyAcceptSpecificLength({required int length}) {
    if (isEmpty) {
      return 'thisFieldIsRequired'.translate;
    }
    if (length < length || length > length) {
      return '${'onlyAccept'.translate} ${length.toString()} ${'numbers'.translate}';
    }
    return null;
  }

  String? emailValidator() {
    final pattern = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (isEmpty) {
      return 'emailIsRequired'.translate;
    } else if (!pattern.hasMatch(this)) {
      return 'enterValidEmailFormat'.translate;
    }
    return null;
  }

  String? urlValidator() {
    final pattern = RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$');
    if (isEmpty) {
      return 'thisFieldIsRequired'.translate;
    } else if (!pattern.hasMatch(this)) {
      return 'enterValidUrlFormat'.translate;
    }
    return null;
  }
}
