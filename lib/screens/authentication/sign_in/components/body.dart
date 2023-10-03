import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/image_strings.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/constants/text_strings.dart';
import 'package:fragrance_of_mastership/screens/authentication/sign_in/components/sign_form.dart';

import '../../../../components/no_account_text.dart';
import '../../../../components/social_card.dart';
import '../../../../constants/constants.dart';
import '../../../../controllers/services/authentication/handle_sign_in.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  fSignInWelcome,
                  style: headingStyle,
                ),
                const Text(
                  fSignInSubTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                const SignForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: fGoogleSvg,
                      press: () async {
                        final googleAuth = GoogleAuth();
                        await googleAuth.googleAuth(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
