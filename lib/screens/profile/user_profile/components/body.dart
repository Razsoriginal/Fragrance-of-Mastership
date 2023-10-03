import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/profile/setting/app_settings/app_settings.dart';
import 'package:fragrance_of_mastership/screens/profile/setting/notifications/notification_settings.dart';
import 'package:fragrance_of_mastership/screens/profile/user_profile/components/user_details.dart';
import 'package:fragrance_of_mastership/screens/profile/user_profile/edit_profile.dart';
import 'package:fragrance_of_mastership/screens/splash/splash_screen.dart';

import '../../../../constants/colors.dart';
import '../../setting/help_center/help_center.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*const ProfilePic(),
          const SizedBox(height: 20),*/
          const UserDetails(),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: fPrimaryColor,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      // backgroundColor: Color(0xFFF5F6F9),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/User Icon.svg",
                          color: fPrimaryColor,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                        const Text("Hello"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: fPrimaryColor,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      // backgroundColor: Color(0xFFF5F6F9),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/User Icon.svg",
                          color: fPrimaryColor,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                        const Text("Hello"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),*/
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
            text: "Edit Profile",
            icon: "assets/icons/User Icon.svg",
            press: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfile())),
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationSettings())),
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AppSettings())),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HelpCenter())),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              logOut(context);
            },
          ),
        ],
      ),
    );
  }

  void logOut(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: fPrimaryLightColor,
              title: const Text("Are you sure you want to sign out?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",
                        style: TextStyle(color: fPrimaryColor))),
                TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: fPrimaryColor),
                    ))
              ],
            ));
  }
}
