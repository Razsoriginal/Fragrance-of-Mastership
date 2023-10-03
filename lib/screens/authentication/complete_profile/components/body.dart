import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/constants.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/constants/text_strings.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
                fCompleteProTitle,
                style: headingStyle,
              ),
              /*const Text(
                fCompleteProSubTitle,
                textAlign: TextAlign.center,
              ),*/
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              CompleteProfileForm(
                email: email,
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
    );
  }
}
