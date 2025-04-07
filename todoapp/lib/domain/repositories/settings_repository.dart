/// Interface for settings repository
abstract class SettingsRepository {
  Future<bool> loadDarkModeSetting();
  Future<void> saveDarkModeSetting(bool isDarkMode);
}
