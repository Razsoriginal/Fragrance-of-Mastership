// All other constants

import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/screens/articles/home/articles_home.dart';
import 'package:fragrance_of_mastership/screens/insights/home/insights_home.dart';
import 'package:fragrance_of_mastership/screens/quiz/home/quiz_home.dart';

import '../screens/dashboard/home/dashboard_home.dart';
import '../screens/events/home/events_home.dart';
import 'colors.dart';

// adb reverse tcp:3000 tcp:3000
const fApiBaseUrl = 'http://localhost:3000';

const fAnimationDuration = Duration(milliseconds: 200);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String fEmailNullError = "Please Enter your email";
const String fInvalidEmailError = "Please Enter Valid Email";
const String fPassNullError = "Please Enter your password";
const String fShortPassError = "Password is too short";
const String fMatchPassError = "Passwords don't match";
const String fNameNullError = "Please Enter your name";
const String fPhoneNumberNullError = "Please Enter your phone number";
const String fAddressNullError = "Please Enter your address";

const String fAuthUserNotFound = "No user found with this email";
const String fAuthWrongPass = "Invalid password";
const String fAuthInvalidEmail = "Invalid email address";
const String fAuthAcctDisabled = "User account has been disabled";
const String fAuthEmailInUse =
    "The email address is already in use by another account";

// Text heading style
final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black);

// otp Form
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: fTextColor),
  );
}

// quick links
const List<Map<String, dynamic>> fQuickLinks = [
  {"icon": "assets/icons/Flash Icon.svg", "text": "Insights"},
  {"icon": "assets/icons/Bill Icon.svg", "text": "Blog"},
  {"icon": "assets/icons/Gift Icon.svg", "text": "Events"},
  {"icon": "assets/icons/Question mark.svg", "text": "Quiz"},
  {"icon": "assets/icons/Discover.svg", "text": "More"},
];

const List<Widget> fQuickLinksWidgets = [
  InsightsHome(),
  ArticlesHome(),
  EventsHome(),
  QuizHome(),
  DashboardHome(),
];
