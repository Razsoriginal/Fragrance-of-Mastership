import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/social_card.dart';
import 'package:fragrance_of_mastership/constants/image_strings.dart';
import 'package:fragrance_of_mastership/constants/text_strings.dart';
import 'package:fragrance_of_mastership/controllers/services/authentication/handle_sign_in.dart';
import 'package:fragrance_of_mastership/screens/authentication/sign_up/components/sign_up_form.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/sizes.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
                fSignUpTitle,
                style: headingStyle,
              ),
              const Text(
                fSignUpSubTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              const SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // add more social media card in if req
                  SocialCard(
                      icon: fGoogleSvg,
                      press: () async {
                        final googleAuth = GoogleAuth();
                        await googleAuth.googleAuth(context);
                      }),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
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
