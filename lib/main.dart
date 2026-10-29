import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy(BrowserPlatformLocation(), true));
  SharedPreferences? storage;
  try {
    storage = await SharedPreferences.getInstance();
  } catch (_) {
    // Storage can be disabled by the browser; the website still works.
  }
  runApp(BalnanaWebsite(preferences: SitePreferences(storage)));
}
