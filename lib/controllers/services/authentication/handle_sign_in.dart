import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/appdata/user/user-model.dart';
import '../../../screens/authentication/complete_profile/complete_profile_screen.dart';
import '../../../screens/authentication/login_success/login_succes_screen.dart';
import '../../user/provider/user_provider.dart';
import 'authentication.dart';

class GoogleAuth {
  Future<void> googleAuth(context) async {
    User? user = await Authentication.signInWithGoogle();
    if (user != null) {
      final userProvider = UserProvider();

      try {
        // Fetch user data based on email
        await userProvider.fetchUserByEmail(user.email ?? "");

        FragranceUser? fetchedUser = userProvider.user;

        if (fetchedUser != null) {
          Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CompleteProfileScreen(email: user.email ?? ""),
            ),
          );
        }
      } catch (e) {
        print("Error fetching user data: $e");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CompleteProfileScreen(email: user.email ?? ""),
          ),
        );
      }
    } else {
      print("Error occurred");
    }
  }
}
