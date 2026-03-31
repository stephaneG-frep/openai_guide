import 'package:flutter/material.dart';

final themeNotifier = ValueNotifier<AppTheme>(AppTheme.greenOrange);

enum AppTheme { greenOrange, redBlue }

extension AppThemeExt on BuildContext {
  bool get isGreenOrange => themeNotifier.value == AppTheme.greenOrange;

  // Couleurs primaires
  Color get primary => isGreenOrange ? const Color(0xFF16A34A) : const Color(0xFFC62828);
  Color get secondary => isGreenOrange ? const Color(0xFFEA580C) : const Color(0xFF1565C0);

  // Fonds
  Color get surfaceBg => isGreenOrange ? const Color(0xFF050F07) : const Color(0xFF050208);
  Color get cardBg => isGreenOrange ? const Color(0xFF0A1A0D) : const Color(0xFF0A0210);
  Color get navy950 => isGreenOrange ? const Color(0xFF030A04) : const Color(0xFF020108);
  Color get navy900 => isGreenOrange ? const Color(0xFF071210) : const Color(0xFF060115);
  Color get navy800 => isGreenOrange ? const Color(0xFF0D2016) : const Color(0xFF0A0220);

  // Accents
  Color get accentLight => isGreenOrange ? const Color(0xFF86EFAC) : const Color(0xFFFFCDD2);
  Color get accentMid => isGreenOrange ? const Color(0xFFEA580C) : const Color(0xFF1976D2);
  Color get codeText => isGreenOrange ? const Color(0xFF86EFAC) : const Color(0xFFEF9A9A);
  Color get codeBorder => isGreenOrange ? const Color(0xFF14532D) : const Color(0xFF5A1A1A);
  Color get tipBorder => isGreenOrange ? const Color(0xFF16A34A) : const Color(0xFFC62828);
  Color get tipText => isGreenOrange ? const Color(0xFF4ADE80) : const Color(0xFFFF8A80);
  Color get steel => isGreenOrange ? const Color(0xFF1A3A22) : const Color(0xFF1A0A22);
  Color get onSurface => isGreenOrange ? const Color(0xFFDCFCE7) : const Color(0xFFFFCDD2);

  // Couleurs texte
  Color get slate50 => const Color(0xFFF8FAFC);
  Color get slate100 => const Color(0xFFF1F5F9);
  Color get slate300 => const Color(0xFFCBD5E1);
  Color get sun => isGreenOrange ? const Color(0xFFFBBF24) : const Color(0xFFFF8A65);

  // Boutons spéciaux
  Color get emerald => isGreenOrange ? const Color(0xFF16A34A) : const Color(0xFFC62828);
  Color get emeraldSoft => isGreenOrange ? const Color(0xFF86EFAC) : const Color(0xFFFFCDD2);
  Color get emeraldBg => isGreenOrange ? const Color(0xFF052E1C) : const Color(0xFF200510);
  Color get amber => isGreenOrange ? const Color(0xFFEA580C) : const Color(0xFF1565C0);
  Color get amberBg => isGreenOrange ? const Color(0xFF431407) : const Color(0xFF0A1F4A);

  // Gradient hero
  List<Color> get heroGradient => isGreenOrange
      ? [const Color(0xFF030A04), const Color(0xFF0A2A12), const Color(0xFF16A34A)]
      : [const Color(0xFF050208), const Color(0xFF1A0040), const Color(0xFFC62828)];

  // Gradient header
  List<Color> get headerGradient => isGreenOrange
      ? [const Color(0xFF0A1A0D), const Color(0xFF14532D)]
      : [const Color(0xFF0A0210), const Color(0xFF4A0020)];

  // Palette animée
  List<Color> get palette => isGreenOrange
      ? [
          const Color(0xFF16A34A),
          const Color(0xFF22C55E),
          const Color(0xFFEA580C),
          const Color(0xFFF97316),
          const Color(0xFF15803D),
          const Color(0xFF16A34A),
        ]
      : [
          const Color(0xFFC62828),
          const Color(0xFFD32F2F),
          const Color(0xFF1565C0),
          const Color(0xFF1976D2),
          const Color(0xFFB71C1C),
          const Color(0xFFC62828),
        ];
}

ThemeData buildMaterialTheme(AppTheme theme) {
  final bool isGreen = theme == AppTheme.greenOrange;
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: isGreen ? const Color(0xFF16A34A) : const Color(0xFFC62828),
      secondary: isGreen ? const Color(0xFFEA580C) : const Color(0xFF1565C0),
      surface: isGreen ? const Color(0xFF050F07) : const Color(0xFF050208),
    ),
    scaffoldBackgroundColor: isGreen ? const Color(0xFF050F07) : const Color(0xFF050208),
    appBarTheme: AppBarTheme(
      backgroundColor: isGreen ? const Color(0xFF0A1A0D) : const Color(0xFF0A0210),
      foregroundColor: const Color(0xFFF8FAFC),
      titleTextStyle: const TextStyle(
        color: Color(0xFFF8FAFC),
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: isGreen ? const Color(0xFF0A1A0D) : const Color(0xFF0A0210),
      indicatorColor: isGreen
          ? const Color(0xFF16A34A).withAlpha(50)
          : const Color(0xFFC62828).withAlpha(50),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(color: Color(0xFFCBD5E1), fontSize: 12),
      ),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: isGreen ? const Color(0xFF86EFAC) : const Color(0xFFFFCDD2),
          );
        }
        return const IconThemeData(color: Color(0xFFCBD5E1));
      }),
    ),
  );
}
