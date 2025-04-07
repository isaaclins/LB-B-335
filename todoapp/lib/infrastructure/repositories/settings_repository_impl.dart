import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  static const String _settingsKey = 'settings';

  @override
  Future<bool> loadDarkModeSetting() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_settingsKey) ?? false;
  }

  @override
  Future<void> saveDarkModeSetting(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_settingsKey, isDarkMode);
  }
}
