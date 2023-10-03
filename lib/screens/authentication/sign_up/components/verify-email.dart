import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/colors.dart';
import 'package:fragrance_of_mastership/screens/authentication/complete_profile/complete_profile_screen.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/sizes.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, required this.email});

  final String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    if (!isEmailVerified) {
      deleteAccount();
    }
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      var snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser!;
      await user.delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? CompleteProfileScreen(email: widget.email)
      : Scaffold(
          appBar: AppBar(
            title: const Text("Email Verification"),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  Text(
                    "Verify Email",
                    style: headingStyle,
                  ),
                  const Text(
                    "An email verification link has\nbeen sent to your inbox",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                  ),
                  Text(
                    "Auto-verifying...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontStyle: FontStyle.italic,
                      color: fPrimaryColor, // You can customize the color here
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      sendVerificationEmail();
                    },
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
