import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_settings.dart';

const _kSettingsKey = 'notice_ia_settings_v1';

Future<AppSettings?> getStoredSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kSettingsKey);
    if (raw == null) return null;
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return AppSettings.fromJson(json);
  } catch (_) {
    return null;
  }
}

Future<void> saveStoredSettings(AppSettings settings) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kSettingsKey, jsonEncode(settings.toJson()));
  } catch (_) {}
}
