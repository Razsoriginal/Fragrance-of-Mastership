import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/constants.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/constants/text_strings.dart';

import '../../../../constants/colors.dart';
import 'otp_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              Text(
                fOtpTitle,
                style: headingStyle,
              ),
              const Text(
                fOtpSubTitle,
                textAlign: TextAlign.center,
              ),
              buildTimer(),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              GestureDetector(
                onTap: () {
                  // resend otp
                },
                child: const Text("Resend OTP Code", style: TextStyle(
                  decoration: TextDecoration.underline,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(fOtpExp),
            TweenAnimationBuilder(
              tween: Tween(begin: fOtpTime, end: 0.0),
              duration: Duration(seconds: fOtpTime.toInt()),
              builder: (_, dynamic value, child) => Text(
                "00:${value.toInt()}",
                style: const TextStyle(color: fPrimaryColor),
              ),
              onEnd: () {},
            ),
          ],
        );
  }
}
