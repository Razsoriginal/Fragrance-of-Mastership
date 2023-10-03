import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/authentication/sign_up/components/verify-email.dart';

import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/services/authentication/authentication.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool remember = false;
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

  Future<void> _signUp() async {
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
      await Authentication.signInWithPassword(
          email: emailController.text, password: passwordController.text);
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => VerifyEmail(email: currentUser.email!),
        ));
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
      } else if (e.code == 'email-already-in-use') {
        errorMessage = fAuthEmailInUse;
      }

      addError(error: errorMessage);
      Navigator.pop(context);
    } catch (e) {
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
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _signUp();
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      controller: confirmPassController,
      // Add controller
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: fPassNullError);
        } else if (value.isNotEmpty && passwordController.text == value) {
          removeError(error: fMatchPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: fPassNullError);
          return "";
        } else if (passwordController.text != value) {
          addError(error: fMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: fLockSvg),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      // Add controller
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: fPassNullError);
        } else if (value.length >= 8) {
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
      controller: emailController,
      // Add controller
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: fEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
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
