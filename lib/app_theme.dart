import 'package:flutter/material.dart';

final themeNotifier = ValueNotifier<AppTheme>(AppTheme.greenOrange);

enum AppTheme { greenOrange, redBlue, nokia }

extension AppThemeExt on BuildContext {
  AppTheme get _t => themeNotifier.value;

  // Couleurs primaires
  Color get primary => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF16A34A),
        AppTheme.redBlue     => const Color(0xFFC62828),
        AppTheme.nokia       => const Color(0xFF4FC3F7),
      };
  Color get secondary => switch (_t) {
        AppTheme.greenOrange => const Color(0xFFEA580C),
        AppTheme.redBlue     => const Color(0xFF1565C0),
        AppTheme.nokia       => const Color(0xFF81D4FA),
      };

  // Fonds
  Color get surfaceBg => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF050F07),
        AppTheme.redBlue     => const Color(0xFF050208),
        AppTheme.nokia       => const Color(0xFF020B18),
      };
  Color get cardBg => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF0A1A0D),
        AppTheme.redBlue     => const Color(0xFF0A0210),
        AppTheme.nokia       => const Color(0xFF071428),
      };
  Color get navy950 => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF030A04),
        AppTheme.redBlue     => const Color(0xFF020108),
        AppTheme.nokia       => const Color(0xFF020A14),
      };
  Color get navy900 => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF071210),
        AppTheme.redBlue     => const Color(0xFF060115),
        AppTheme.nokia       => const Color(0xFF04101F),
      };
  Color get navy800 => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF0D2016),
        AppTheme.redBlue     => const Color(0xFF0A0220),
        AppTheme.nokia       => const Color(0xFF0A1E38),
      };

  // Accents
  Color get accentLight => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF86EFAC),
        AppTheme.redBlue     => const Color(0xFFFFCDD2),
        AppTheme.nokia       => const Color(0xFFB3E5FC),
      };
  Color get accentMid => switch (_t) {
        AppTheme.greenOrange => const Color(0xFFEA580C),
        AppTheme.redBlue     => const Color(0xFF1976D2),
        AppTheme.nokia       => const Color(0xFF4FC3F7),
      };
  Color get codeText => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF86EFAC),
        AppTheme.redBlue     => const Color(0xFFEF9A9A),
        AppTheme.nokia       => const Color(0xFF80DEEA),
      };
  Color get codeBorder => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF14532D),
        AppTheme.redBlue     => const Color(0xFF5A1A1A),
        AppTheme.nokia       => const Color(0xFF0D3A52),
      };
  Color get tipBorder => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF16A34A),
        AppTheme.redBlue     => const Color(0xFFC62828),
        AppTheme.nokia       => const Color(0xFF0288D1),
      };
  Color get tipText => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF4ADE80),
        AppTheme.redBlue     => const Color(0xFFFF8A80),
        AppTheme.nokia       => const Color(0xFF4FC3F7),
      };
  Color get steel => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF1A3A22),
        AppTheme.redBlue     => const Color(0xFF1A0A22),
        AppTheme.nokia       => const Color(0xFF0F2A45),
      };
  Color get onSurface => switch (_t) {
        AppTheme.greenOrange => const Color(0xFFDCFCE7),
        AppTheme.redBlue     => const Color(0xFFFFCDD2),
        AppTheme.nokia       => const Color(0xFFE1F5FE),
      };

  // Couleurs texte
  Color get slate50 => _t == AppTheme.nokia
      ? const Color(0xFFD0E8F5)
      : const Color(0xFFF8FAFC);
  Color get slate100 => _t == AppTheme.nokia
      ? const Color(0xFFBDD8EC)
      : const Color(0xFFF1F5F9);
  Color get slate300 => _t == AppTheme.nokia
      ? const Color(0xFF7AAFC8)
      : const Color(0xFFCBD5E1);
  Color get sun => switch (_t) {
        AppTheme.greenOrange => const Color(0xFFFBBF24),
        AppTheme.redBlue     => const Color(0xFFFF8A65),
        AppTheme.nokia       => const Color(0xFF7ECFFF),
      };

  // Boutons spéciaux
  Color get emerald => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF16A34A),
        AppTheme.redBlue     => const Color(0xFFC62828),
        AppTheme.nokia       => const Color(0xFF0288D1),
      };
  Color get emeraldSoft => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF86EFAC),
        AppTheme.redBlue     => const Color(0xFFFFCDD2),
        AppTheme.nokia       => const Color(0xFFB3E5FC),
      };
  Color get emeraldBg => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF052E1C),
        AppTheme.redBlue     => const Color(0xFF200510),
        AppTheme.nokia       => const Color(0xFF012F4F),
      };
  Color get amber => switch (_t) {
        AppTheme.greenOrange => const Color(0xFFEA580C),
        AppTheme.redBlue     => const Color(0xFF1565C0),
        AppTheme.nokia       => const Color(0xFF0277BD),
      };
  Color get amberBg => switch (_t) {
        AppTheme.greenOrange => const Color(0xFF431407),
        AppTheme.redBlue     => const Color(0xFF0A1F4A),
        AppTheme.nokia       => const Color(0xFF01223A),
      };

  // Gradient hero
  List<Color> get heroGradient => switch (_t) {
        AppTheme.greenOrange => [const Color(0xFF030A04), const Color(0xFF0A2A12), const Color(0xFF16A34A)],
        AppTheme.redBlue     => [const Color(0xFF050208), const Color(0xFF1A0040), const Color(0xFFC62828)],
        AppTheme.nokia       => [const Color(0xFF020B18), const Color(0xFF04203A), const Color(0xFF0277BD)],
      };

  // Gradient header
  List<Color> get headerGradient => switch (_t) {
        AppTheme.greenOrange => [const Color(0xFF0A1A0D), const Color(0xFF14532D)],
        AppTheme.redBlue     => [const Color(0xFF0A0210), const Color(0xFF4A0020)],
        AppTheme.nokia       => [const Color(0xFF071428), const Color(0xFF0A2748)],
      };

  // Palette animée
  List<Color> get palette => switch (_t) {
        AppTheme.greenOrange => [
            const Color(0xFF16A34A), const Color(0xFF22C55E),
            const Color(0xFFEA580C), const Color(0xFFF97316),
            const Color(0xFF15803D), const Color(0xFF16A34A),
          ],
        AppTheme.redBlue => [
            const Color(0xFFC62828), const Color(0xFFD32F2F),
            const Color(0xFF1565C0), const Color(0xFF1976D2),
            const Color(0xFFB71C1C), const Color(0xFFC62828),
          ],
        AppTheme.nokia => [
            const Color(0xFF0288D1), const Color(0xFF4FC3F7),
            const Color(0xFF0277BD), const Color(0xFF81D4FA),
            const Color(0xFF01579B), const Color(0xFF0288D1),
          ],
      };
}

ThemeData buildMaterialTheme(AppTheme theme) {
  final bool isNokia = theme == AppTheme.nokia;
  final bool isGreen = theme == AppTheme.greenOrange;

  final Color primary = isGreen
      ? const Color(0xFF16A34A)
      : isNokia
          ? const Color(0xFF0288D1)
          : const Color(0xFFC62828);
  final Color surface = isGreen
      ? const Color(0xFF050F07)
      : isNokia
          ? const Color(0xFF020B18)
          : const Color(0xFF050208);
  final Color cardBg = isGreen
      ? const Color(0xFF0A1A0D)
      : isNokia
          ? const Color(0xFF071428)
          : const Color(0xFF0A0210);

  final Color textPrimary =
      isNokia ? const Color(0xFFD0E8F5) : const Color(0xFFF8FAFC);
  final Color textSecondary =
      isNokia ? const Color(0xFF7AAFC8) : const Color(0xFFCBD5E1);

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: isGreen
          ? const Color(0xFFEA580C)
          : isNokia
              ? const Color(0xFF81D4FA)
              : const Color(0xFF1565C0),
      surface: surface,
    ),
    scaffoldBackgroundColor: surface,
    textTheme: isNokia
        ? const TextTheme(
            bodyLarge:  TextStyle(fontSize: 17, color: Color(0xFFD0E8F5)),
            bodyMedium: TextStyle(fontSize: 15, color: Color(0xFFD0E8F5)),
            bodySmall:  TextStyle(fontSize: 13, color: Color(0xFF7AAFC8)),
            titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFFD0E8F5)),
            titleMedium:TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFFD0E8F5)),
            labelSmall: TextStyle(fontSize: 13, color: Color(0xFF7AAFC8)),
          )
        : null,
    appBarTheme: AppBarTheme(
      backgroundColor: cardBg,
      foregroundColor: textPrimary,
      titleTextStyle: TextStyle(
        color: textPrimary,
        fontSize: isNokia ? 22 : 20,
        fontWeight: FontWeight.w800,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: cardBg,
      indicatorColor: primary.withAlpha(50),
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(
          color: textSecondary,
          fontSize: isNokia ? 13 : 12,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: isGreen
                ? const Color(0xFF86EFAC)
                : isNokia
                    ? const Color(0xFFB3E5FC)
                    : const Color(0xFFFFCDD2),
            size: isNokia ? 26 : 24,
          );
        }
        return IconThemeData(color: textSecondary, size: isNokia ? 26 : 24);
      }),
    ),
  );
}
