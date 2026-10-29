import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'core/browser.dart';
import 'core/preferences.dart';
import 'design/components.dart';
import 'design/theme.dart';
import 'features/home/home_page.dart';
import 'l10n/site_localizations.dart';

class BalnanaWebsite extends StatefulWidget {
  const BalnanaWebsite({super.key, required this.preferences});
  final SitePreferences preferences;
  @override
  State<BalnanaWebsite> createState() => _BalnanaWebsiteState();
}

class _BalnanaWebsiteState extends State<BalnanaWebsite> {
  late final router = GoRouter(
    redirect: (context, state) {
      if (state.uri.path == '/') {
        return Uri(
          path: '/${widget.preferences.preferredLanguage}',
          fragment: state.uri.fragment.isEmpty ? null : state.uri.fragment,
        ).toString();
      }
      if (state.uri.pathSegments.length == 1) {
        final raw = state.uri.pathSegments.first;
        final tag = supportedTag(raw);
        if (tag != null && raw != tag) {
          return Uri(
            path: '/$tag',
            fragment: state.uri.fragment.isEmpty ? null : state.uri.fragment,
          ).toString();
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/:language',
        pageBuilder: (context, state) {
          final tag = supportedTag(state.pathParameters['language']);
          return NoTransitionPage<void>(
            key: ValueKey(tag ?? 'missing'),
            child: tag == null
                ? const MissingPage()
                : HomePage(tag: tag, preferences: widget.preferences, section: state.uri.fragment),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => const MissingPage(),
  );

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: Listenable.merge([widget.preferences, router.routeInformationProvider]),
    builder: (context, _) {
      final segments = router.routeInformationProvider.value.uri.pathSegments;
      final tag = supportedTag(segments.firstOrNull) ?? widget.preferences.preferredLanguage;
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: siteTheme(Brightness.light),
        darkTheme: siteTheme(Brightness.dark),
        themeMode: widget.preferences.themeMode,
        locale: localeFor(tag),
        supportedLocales: SiteLocalizations.supportedLocales,
        localizationsDelegates: siteLocalizationDelegates,
        onGenerateTitle: (context) => 'Balnana — ${context.l.heroTitle.replaceAll('\n', ' ')}',
        routerConfig: router,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        builder: (context, child) {
          updateDocument(
            tag,
            'Balnana — ${context.l.heroTitle.replaceAll('\n', ' ')}',
            context.l.heroBody,
            context.isDark ? 'dark' : 'light',
          );
          return child ?? const SizedBox.shrink();
        },
      );
    },
  );
}

class MissingPage extends StatelessWidget {
  const MissingPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BrandMark(size: 70),
            const SizedBox(height: 32),
            Text(
              context.l.notFound,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.go('/${Localizations.localeOf(context).toLanguageTag()}'),
              child: Text(context.l.backHome),
            ),
          ],
        ),
      ),
    ),
  );
}
