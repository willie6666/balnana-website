import 'package:balnana_website/app.dart';
import 'package:balnana_website/core/preferences.dart';
import 'package:balnana_website/design/theme.dart';
import 'package:balnana_website/features/home/home_page.dart';
import 'package:balnana_website/features/demo/demo_section.dart';
import 'package:balnana_website/l10n/site_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget localized(Widget child, String tag, {double scale = 1}) => MaterialApp(
  theme: siteTheme(Brightness.light),
  locale: localeFor(tag),
  supportedLocales: SiteLocalizations.supportedLocales,
  localizationsDelegates: siteLocalizationDelegates,
  builder: (context, child) => MediaQuery(
    data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
    child: child!,
  ),
  home: Scaffold(body: SingleChildScrollView(child: child)),
);

void main() {
  for (final tag in languageNames.keys) {
    testWidgets('$tag: complete homepage fits mobile and desktop', (tester) async {
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final width in [360.0, 390.0, 768.0, 1024.0, 1440.0]) {
        tester.view.physicalSize = Size(width, 950);
        await tester.pumpWidget(
          MaterialApp(
            theme: siteTheme(Brightness.light),
            locale: localeFor(tag),
            supportedLocales: SiteLocalizations.supportedLocales,
            localizationsDelegates: siteLocalizationDelegates,
            home: HomePage(tag: tag, preferences: SitePreferences(null)),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: '$tag at $width');
        await tester.pumpWidget(const SizedBox.shrink());
      }
    });
  }
  testWidgets('minimum viewport and enlarged Arabic/German text do not overflow', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(320, 850);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final tag in ['en', 'de', 'ar', 'zh-Hant']) {
      await tester.pumpWidget(
        MaterialApp(
          theme: siteTheme(Brightness.dark),
          locale: localeFor(tag),
          supportedLocales: SiteLocalizations.supportedLocales,
          localizationsDelegates: siteLocalizationDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
          home: HomePage(tag: tag, preferences: SitePreferences(null)),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: '$tag at 200%');
      await tester.pumpWidget(const SizedBox.shrink());
    }
  });
  testWidgets('demo edits recalculate and reset without accepting invalid money', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(localized(const DemoSection(), 'en'));
    await tester.pumpAndSettle();
    expect(find.text('¥9,000'), findsOneWidget);
    await tester.enterText(find.byKey(const ValueKey('demo-amount')), '16000');
    await tester.pumpAndSettle();
    expect(find.text('¥12,000'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('payer-1')));
    await tester.pumpAndSettle();
    expect(find.text('Jamie is owed'), findsOneWidget);
    await tester.enterText(find.byKey(const ValueKey('demo-amount')), '0');
    await tester.pump();
    expect(find.text('Enter an amount greater than zero.'), findsOneWidget);
    await tester.ensureVisible(find.byKey(const ValueKey('demo-reset')));
    await tester.tap(find.byKey(const ValueKey('demo-reset')));
    await tester.pumpAndSettle();
    expect(find.text('¥9,000'), findsOneWidget);
    await tester.enterText(find.byKey(const ValueKey('demo-amount')), '1');
    await tester.pumpAndSettle();
    expect(find.text('Everyone is settled up.'), findsNWidgets(2));
  });
  testWidgets('theme and language controls update the app and persist choices', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final storage = await SharedPreferences.getInstance();
    final preferences = SitePreferences(storage);
    tester.view.physicalSize = const Size(1440, 950);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(BalnanaWebsite(preferences: preferences));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('theme-picker')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();
    expect(preferences.themeMode, ThemeMode.dark);
    expect(storage.getString('site.theme'), 'dark');
    await tester.tap(find.byKey(const ValueKey('language-picker')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, '繁體');
    await tester.pumpAndSettle();
    await tester.tap(find.text('繁體中文'));
    await tester.pumpAndSettle();
    expect(storage.getString('site.locale'), 'zh-Hant');
    expect(find.text('一起玩，\n輕鬆算清。'), findsOneWidget);
  });
}
