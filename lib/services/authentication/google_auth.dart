import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fragrance/services/firestore/user_add.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../homepage.dart';

class googleAuth {
  Future<UserCredential?> signInwithGoogle(BuildContext context) async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from req
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create new credential or user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      // let user sign in
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // add user info in firestore
      user_add().addUserData('', gUser.displayName!, gUser!.email, gUser!.photoUrl, 1);

      // navigate to home page
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      // show a toast notification
      Fluttertoast.showToast(
          msg: "Login failed. Please check your credentials and try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return null;
    }
  }
}
