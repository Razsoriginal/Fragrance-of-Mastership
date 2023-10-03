import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/models/appdata/user/user-model.dart';
import 'package:fragrance_of_mastership/screens/authentication/complete_profile/components/location_info_form.dart';

import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class LocationInfoScreen extends StatelessWidget {
  const LocationInfoScreen({super.key, required this.localUser});
  final FragranceUser localUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Text(
                  "Almost There",
                  style: headingStyle,
                ),
                /*const Text(
                fCompleteProSubTitle,
                textAlign: TextAlign.center,
              ),*/
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                LocationInfoForm(
                  localUser: localUser,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                const Text(
                  fSignUpNote,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
