import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/progress_state.dart';

const _kProgressKey = 'notice_ia_progress_v1';

Future<ProgressState?> getStoredProgress() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kProgressKey);
    if (raw == null) return null;
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return ProgressState.fromJson(json);
  } catch (_) {
    return null;
  }
}

Future<void> saveStoredProgress(ProgressState progress) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kProgressKey, jsonEncode(progress.toJson()));
  } catch (_) {}
}

Future<void> clearStoredProgress() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kProgressKey);
  } catch (_) {}
}
