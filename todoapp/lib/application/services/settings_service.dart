import 'package:flutter/foundation.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsService with ChangeNotifier {
  final SettingsRepository _repository;
  bool _isDarkMode = false;

  SettingsService(this._repository) {
    _loadSettings();
  }

  bool get isDarkMode => _isDarkMode;

  Future<void> _loadSettings() async {
    _isDarkMode = await _repository.loadDarkModeSetting();
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    await _repository.saveDarkModeSetting(_isDarkMode);
    notifyListeners();
  }
}
