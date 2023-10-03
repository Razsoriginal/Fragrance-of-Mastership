import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 05)
class SettingsModel {
  @HiveField(0)
  double arabicSize;

  @HiveField(1)
  double translationSize;

  @HiveField(2)
  bool showNotifications;

  @HiveField(3)
  bool inAppNotifications;

  @HiveField(4)
  bool classNotifications;

  @HiveField(5)
  bool generalAnnouncements;

  SettingsModel({
    required this.arabicSize,
    required this.translationSize,
    required this.showNotifications,
    required this.inAppNotifications,
    required this.classNotifications,
    required this.generalAnnouncements,
  });
}
