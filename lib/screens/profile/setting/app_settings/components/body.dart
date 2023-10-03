import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/controllers/services/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/colors.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) {
          final settings = settingsProvider.settings;
          double arabicSize = settings?.arabicSize ?? 35;
          double transSize = settings?.translationSize ?? 20;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        child: Text(
                          "Adjust text size on screen",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Arabic & Urdu",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِِِ",
                      style: TextStyle(
                        fontFamily: 'arabic',
                        fontSize: arabicSize,
                        height: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      activeColor: fPrimaryColor,
                      value: arabicSize,
                      onChanged: (double value) {
                        settingsProvider.updateSetting('arabicSize', value);
                      },
                      divisions: 30,
                      min: 25.0,
                      max: 55.0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "Description & Translation",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "In the Name of Allah, the Merciful, the Beneficent.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: transSize),
                    ),
                    Slider(
                      activeColor: fPrimaryColor,
                      value: transSize,
                      onChanged: (double value) {
                        settingsProvider.updateSetting(
                            'translationSize', value);
                      },
                      divisions: 30,
                      min: 15.0,
                      max: 35.0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  settingsProvider.updateSetting('arabicSize', 35.0);
                  settingsProvider.updateSetting('translationSize', 20.0);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                ),
                child: Text(
                  "Reset",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
