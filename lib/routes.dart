import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/articles/home/articles_home.dart';
import 'package:fragrance_of_mastership/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:fragrance_of_mastership/screens/authentication/login_success/login_succes_screen.dart';
import 'package:fragrance_of_mastership/screens/authentication/otp/otp_screen.dart';
import 'package:fragrance_of_mastership/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:fragrance_of_mastership/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:fragrance_of_mastership/screens/home/home_page/home_page.dart';
import 'package:fragrance_of_mastership/screens/home/home_screen.dart';
import 'package:fragrance_of_mastership/screens/profile/user_profile/profile_screen.dart';
import 'package:fragrance_of_mastership/screens/splash/splash_screen.dart';
import 'package:fragrance_of_mastership/screens/traditions/home/traditions_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),

  // Home screen route
  // create a different route class and call this if logged in
  HomeScreen.routeName: (context) => const HomeScreen(),
  TraditionScreen.routeName: (context) => const TraditionScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  TraditionsScreen.routeName: (context) => const TraditionsScreen(),
  ArticlesHome.routeName: (context) => const ArticlesHome(),
};
