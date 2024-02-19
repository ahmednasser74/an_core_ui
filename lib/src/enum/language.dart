enum Language { en, ar, fr, franco }

extension LanguageExtension on Language {
  String get value => switch (this) {
        Language.ar => 'ar',
        Language.en => 'en',
        Language.fr => 'fr',
        Language.franco => 'franco',
      };
}
