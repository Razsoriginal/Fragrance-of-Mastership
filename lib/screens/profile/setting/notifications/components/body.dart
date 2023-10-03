import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../controllers/services/settings/provider/settings_provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Text("Notifications", style: headingStyle),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: fTileColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SwitchListTile(
              title: const Text(
                "Show Notifications",
                style: TextStyle(color: fPrimaryColor),
              ),
              value: settingsProvider.settings?.showNotifications ?? true,
              onChanged: (bool value) {
                setState(() {
                  if (value || settingsProvider.settings!.showNotifications ??
                      false) {
                    settingsProvider.updateSetting("showNotifications", value);
                    if (!value) {
                      settingsProvider.updateSetting(
                          "inAppNotifications", false);
                      settingsProvider.updateSetting(
                          "classNotifications", false);
                      settingsProvider.updateSetting(
                          "generalAnnouncements", false);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Enable 'Show Notifications' to change this setting."),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 35),
          Container(
            decoration: BoxDecoration(
              color: fTileColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                buildSwitchListTile(
                  "In App Notifications",
                  settingsProvider.settings?.inAppNotifications ?? true,
                  (bool value) {
                    setState(() {
                      if (settingsProvider.settings?.showNotifications ??
                          false) {
                        settingsProvider.updateSetting(
                            "inAppNotifications", value);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Enable 'Show Notifications' to change this setting."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                ),
                const SizedBox(height: 20),
                buildSwitchListTile(
                  "Class Notifications",
                  settingsProvider.settings?.classNotifications ?? true,
                  (bool value) {
                    setState(() {
                      if (settingsProvider.settings?.showNotifications ??
                          false) {
                        settingsProvider.updateSetting(
                            "classNotifications", value);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Enable 'Show Notifications' to change this setting."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                ),
                const SizedBox(height: 20),
                buildSwitchListTile(
                  "General Announcements",
                  settingsProvider.settings?.generalAnnouncements ?? true,
                  (bool value) {
                    setState(() {
                      if (settingsProvider.settings?.showNotifications ??
                          false) {
                        settingsProvider.updateSetting(
                            "generalAnnouncements", value);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Enable 'Show Notifications' to change this setting."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
