import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/site_localizations.dart';

const siteLocalizationDelegates = [
  SiteLocalizations.delegate,
  ...GlobalMaterialLocalizations.delegates,
];

const languageNames = <String, String>{
  'en': 'English',
  'zh-Hant': '繁體中文',
  'zh': '简体中文',
  'ja': '日本語',
  'ko': '한국어',
  'es': 'Español',
  'fr': 'Français',
  'de': 'Deutsch',
  'pt': 'Português',
  'it': 'Italiano',
  'ru': 'Русский',
  'uk': 'Українська',
  'pl': 'Polski',
  'nl': 'Nederlands',
  'tr': 'Türkçe',
  'vi': 'Tiếng Việt',
  'id': 'Bahasa Indonesia',
  'th': 'ไทย',
  'ar': 'العربية',
  'hi': 'हिन्दी',
};

String? supportedTag(String? tag) {
  if (tag == null) return null;
  final parts = tag.replaceAll('_', '-').split('-');
  final language = parts.first.toLowerCase();
  if (language == 'zh') {
    return parts.any((p) => ['hant', 'tw', 'hk', 'mo'].contains(p.toLowerCase()))
        ? 'zh-Hant'
        : 'zh';
  }
  return languageNames.containsKey(language) ? language : null;
}

Locale localeFor(String tag) => tag == 'zh-Hant'
    ? const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
    : Locale(tag);

class SitePreferences extends ChangeNotifier {
  SitePreferences(this.storage) {
    themeMode = ThemeMode.values.asNameMap()[storage?.getString('site.theme')] ?? ThemeMode.system;
    savedLanguage = supportedTag(storage?.getString('site.locale'));
  }
  final SharedPreferences? storage;
  late ThemeMode themeMode;
  String? savedLanguage;

  String get preferredLanguage {
    if (savedLanguage case final saved?) return saved;
    for (final locale in WidgetsBinding.instance.platformDispatcher.locales) {
      if (supportedTag(locale.toLanguageTag()) case final match?) return match;
    }
    return 'en';
  }

  Future<void> setTheme(ThemeMode mode) async {
    themeMode = mode;
    notifyListeners();
    try {
      await storage?.setString('site.theme', mode.name);
    } catch (_) {
      /* Memory state remains available. */
    }
  }

  Future<void> setLanguage(String tag) async {
    savedLanguage = tag;
    try {
      await storage?.setString('site.locale', tag);
    } catch (_) {
      /* Memory state remains available. */
    }
  }
}

extension SiteL10n on BuildContext {
  SiteLocalizations get l => SiteLocalizations.of(this);
}
