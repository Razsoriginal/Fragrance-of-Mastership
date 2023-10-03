import '../../../models/appdata/settings/settings_model.dart';
import '../hive_service_base.dart';

class SettingsService extends HiveServiceBase<SettingsModel> {
  Future<void> init() async {
    await initBox('settings');
  }

  Future<void> updateSetting(String fieldName, dynamic value) async {
    final settings = loadSettings();

    if (fieldName == 'arabicSize') {
      settings?.arabicSize = value as double;
    } else if (fieldName == 'translationSize') {
      settings?.translationSize = value as double;
    } else if (fieldName == 'showNotifications') {
      settings?.showNotifications = value as bool;
    } else if (fieldName == 'inAppNotifications') {
      settings?.inAppNotifications = value as bool;
    } else if (fieldName == 'classNotifications') {
      settings?.classNotifications = value as bool;
    } else if (fieldName == 'generalAnnouncements') {
      settings?.generalAnnouncements = value as bool;
    }

    await box.put(0, settings!);
  }

  SettingsModel? loadSettings() {
    return box.get(0,
        defaultValue: SettingsModel(
            arabicSize: 35.0,
            translationSize: 20.0,
            showNotifications: true,
            inAppNotifications: true,
            classNotifications: true,
            generalAnnouncements: true));
  }

  Future<void> clearSettings() async {
    await box.clear();
  }
}
