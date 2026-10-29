import 'package:flutter/widget_previews.dart';
import 'package:material_ui/material_ui.dart';

import '../core/preferences.dart';
import '../features/demo/demo_section.dart';
import '../l10n/site_localizations.dart';
import 'theme.dart';

@Preview(name: 'Balance · light', group: 'Balnana', size: Size(480, 570))
Widget balanceLightPreview() => previewBalance(Brightness.light);

@Preview(name: 'Balance · dark', group: 'Balnana', size: Size(480, 570))
Widget balanceDarkPreview() => previewBalance(Brightness.dark);

Widget previewBalance(Brightness brightness) => MaterialApp(
  theme: siteTheme(brightness),
  locale: const Locale('en'),
  supportedLocales: SiteLocalizations.supportedLocales,
  localizationsDelegates: siteLocalizationDelegates,
  home: const Scaffold(
    body: Padding(padding: EdgeInsets.all(20), child: BalancePreview(hero: true)),
  ),
);
