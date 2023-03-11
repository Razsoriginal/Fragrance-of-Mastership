import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../services/authentication/phone_auth.dart';

class otp_screen extends StatelessWidget {
  final String ph_num;
  final String verificationId;
  final String name;
  final String email;
  otp_screen({required this.ph_num, required this.verificationId, required this.name, required this.email});
  var code;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(
              children: [
                SizedBox(height: 140,),
                Icon(Icons.mark_email_unread_outlined, size: 140,),
                SizedBox(height: 5,),
                Center(child: Text("Verification", style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w400,))),
                SizedBox(height: 10,),
                Center(child: Text("Enter the OTP code sent to\n" + "+91 " + ph_num, textAlign: TextAlign.center,)),
                InkWell(onTap: () {Navigator.pop(context);},
                  child: Text("Change phone number?", textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),),
                SizedBox(height: 30,),
                //razs_country_select(),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 6,
                        onSubmit: (String verificationCode) {
                          code = (verificationCode);
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 25,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize: Size(305, 45), //////// HERE
                        ),
                        onPressed: () async{
                          final AuthRepository authRepository = AuthRepository();
                          authRepository.verifyOTP(verificationId, code, ph_num, name, email, context);
                        },
                        child: Text('SUBMIT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
