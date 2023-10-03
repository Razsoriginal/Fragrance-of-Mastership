import 'package:flutter/material.dart';

import '../../../../models/appdata/settings/settings_model.dart';
import '../settings_service.dart';

class SettingsProvider with ChangeNotifier {
  late SettingsService _settingsService;
  SettingsModel? _settings;

  SettingsProvider() {
    _settingsService = SettingsService();
    _init();
  }

  Future<void> _init() async {
    await _settingsService.init();
    _settings = _settingsService.loadSettings();
    notifyListeners();
  }

  SettingsModel? get settings => _settings;

  Future<void> updateSetting(String fieldName, dynamic value) async {
    if (_settings != null) {
      await _settingsService.updateSetting(fieldName, value);
      _settings = _settingsService.loadSettings();
      notifyListeners();
    }
  }

  Future<void> clearSettings() async {
    await _settingsService.clearSettings();
    _settings = SettingsModel(
        arabicSize: 35.0,
        translationSize: 20.0,
        showNotifications: true,
        inAppNotifications: true,
        classNotifications: true,
        generalAnnouncements: true);
    notifyListeners();
  }
}
