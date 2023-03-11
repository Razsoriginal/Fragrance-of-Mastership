import  'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fragrance/homepage.dart';
import 'package:fragrance/screens/authentication/phone_otp_screen.dart';
import 'package:fragrance/services/firestore/user_add.dart';

class AuthRepository {
  Future<void> sendVerificationCode(String phoneNumber, BuildContext context, String name, String email) async {
    String verificationId;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String _verificationId, int? resendToken) {
        verificationId = _verificationId;
        Navigator.push(context, MaterialPageRoute(builder: (context) => otp_screen(ph_num: phoneNumber, verificationId: verificationId, name: name, email: email,)));
      },
      codeAutoRetrievalTimeout: (String _verificationId) {},
    );
  }

  Future<void> verifyOTP(String verificationId, String code, String phoneNumber, String name, String email, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage()));
    user_add().addUserData(phoneNumber, name, email, null, 2);
  }

}