import 'package:material_ui/material_ui.dart';

const banana = Color(0xFFE8A800);
const memberColors = [Color(0xFF8A5A3C), Color(0xFF8E5BC8), Color(0xFF3E8EDE), Color(0xFFCF6025)];

ThemeData siteTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme = ColorScheme.fromSeed(seedColor: banana, brightness: brightness).copyWith(
    primary: dark ? const Color(0xFFECCA6E) : const Color(0xFF765800),
    onPrimary: dark ? const Color(0xFF3A2C00) : Colors.white,
    primaryContainer: dark ? const Color(0xFF51431E) : const Color(0xFFF8E3AD),
    onPrimaryContainer: dark ? const Color(0xFFF8DF9A) : const Color(0xFF4D3900),
    surface: dark ? const Color(0xFF191A16) : const Color(0xFFFCF9F4),
    onSurface: dark ? const Color(0xFFF3F0E7) : const Color(0xFF24251E),
    onSurfaceVariant: dark ? const Color(0xFFC1BEB3) : const Color(0xFF66655C),
    surfaceContainer: dark ? const Color(0xFF252620) : const Color(0xFFF3EFE6),
    surfaceContainerHigh: dark ? const Color(0xFF31322A) : const Color(0xFFEAE6DC),
    outlineVariant: dark ? const Color(0xFF414238) : const Color(0xFFDAD6CB),
  );
  final base = ThemeData(useMaterial3: true, colorScheme: scheme, fontFamily: 'PlusJakartaSans');
  return base.copyWith(
    scaffoldBackgroundColor: scheme.surface,
    textTheme: base.textTheme.apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: banana,
        foregroundColor: const Color(0xFF352900),
        minimumSize: const Size(48, 56),
        padding: const EdgeInsets.symmetric(horizontal: 28),
        textStyle: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: scheme.onSurface,
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        textStyle: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.primary, width: 2),
      ),
    ),
    dividerTheme: DividerThemeData(color: scheme.outlineVariant, thickness: 1),
    popupMenuTheme: PopupMenuThemeData(
      color: scheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}

extension SiteTheme on BuildContext {
  ColorScheme get c => Theme.of(this).colorScheme;
  bool get isDark => c.brightness == Brightness.dark;
  Color get positive => isDark ? const Color(0xFF7FD8A0) : const Color(0xFF1E7A46);
  Color get negative => isDark ? const Color(0xFFFFB4A8) : const Color(0xFFB42318);
}
