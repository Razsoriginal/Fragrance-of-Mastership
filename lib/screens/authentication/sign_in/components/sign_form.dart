import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/image_strings.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/services/authentication/authentication.dart';
import '../../../../controllers/user/provider/user_provider.dart';
import '../../complete_profile/complete_profile_screen.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_succes_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _loginUser() async {
    FocusScope.of(context).unfocus();
    removeError(error: fAuthUserNotFound);
    removeError(error: fAuthWrongPass);
    removeError(error: fAuthInvalidEmail);
    removeError(error: fAuthAcctDisabled);

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await Authentication.logInWithPassword(
          email: email!, password: password!);
      final userProvider = UserProvider();
      try {
        await userProvider.fetchUserByEmail(email!);
        Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
        await userProvider.init();
      } catch (e) {
        print("Error: $e");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompleteProfileScreen(email: email ?? ""),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';

      if (e.code == 'user-not-found') {
        errorMessage = fAuthUserNotFound;
      } else if (e.code == 'wrong-password') {
        errorMessage = fAuthWrongPass;
      } else if (e.code == 'invalid-email') {
        errorMessage = fAuthInvalidEmail;
      } else if (e.code == 'user-disabled') {
        errorMessage = fAuthAcctDisabled;
      }

      addError(error: errorMessage);
      Navigator.pop(context);
    } catch (e) {
      print('Error: $e');
      addError(error: 'An error occurred');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: fPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // login code - firebase
                _loginUser(); // auth
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                await userProvider.fetchUserByEmail(email!);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: fPassNullError);
        } else {
          removeError(error: fShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: fPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: fShortPassError);
          return "";
        }
        removeError(
            error:
                fShortPassError); // Add this line to remove the error when the length is valid
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: fLockSvg),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: fEmailNullError);
        } else {
          removeError(error: fInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: fEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: fInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: fMailSvg),
      ),
    );
  }
}
