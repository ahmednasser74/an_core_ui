enum Language { en, ar, fr, franco }

extension LanguageExtension on Language {
  String get value => switch (this) {
        Language.ar => 'ar',
        Language.en => 'en',
        Language.fr => 'fr',
        Language.franco => 'franco',
      };

  String get text => switch (this) {
        Language.ar => 'العربية',
        Language.en => 'English',
        Language.fr => 'Français',
        Language.franco => 'Franco',
      };
}
