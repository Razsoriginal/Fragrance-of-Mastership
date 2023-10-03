import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/default_button.dart';
import 'package:fragrance_of_mastership/components/form_error.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/screens/authentication/complete_profile/location_info_Screen.dart';

import '../../../../../components/app_dropdown_input.dart';
import '../../../../../components/custom_suffix_icon.dart';
import '../../../../../components/text-input-field.dart';
import '../../../../../constants/constants.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../models/appdata/user/user-model.dart';

class CompleteProfileForm extends StatefulWidget {
  final String email;

  const CompleteProfileForm({
    super.key,
    required this.email,
  });

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  List<String?> errors = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String gender = 'Male';
  String ageGroup = '15 to 25';
  String preferredLang = "English";

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextInputField(
            hintText: "Enter your first Name",
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: fNameNullError);
                nameController.text = value;
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: fNameNullError);
                return "";
              } else {
                removeError(error: fNameNullError);
              }
              return null;
            },
            labelText: 'Name',
            suffixIcon: const CustomSuffixIcon(svgIcon: fUserSvg),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          AppTextInputField(
            keyboardType: TextInputType.phone,
            hintText: "Enter your Phone Number",
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: fPhoneNumberNullError);
                phoneNumberController.text = value;
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: fPhoneNumberNullError);
                return "";
              } else {
                removeError(error: fPhoneNumberNullError);
              }
              return null;
            },
            labelText: 'Phone Number',
            suffixIcon: const CustomSuffixIcon(svgIcon: fPhoneSvg),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          AppDropdownInput(
            hintText: 'Gender',
            options: const ['Male', 'Female'],
            value: gender,
            getLabel: (String value) => value,
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          AppDropdownInput(
            hintText: 'Age Group',
            options: const ['Less than 15', '15 to 25', '26 to 40', 'Above 40'],
            value: ageGroup,
            getLabel: (String value) => value,
            onChanged: (value) {
              setState(() {
                ageGroup = value;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          AppDropdownInput(
            hintText: 'Preferred Language',
            options: const ['English', 'Gujarati', 'Urdu'],
            value: preferredLang,
            getLabel: (String value) => value,
            onChanged: (value) {
              setState(() {
                preferredLang = value;
              });
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                saveProfileInfo();
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> saveProfileInfo() async {
    if (_formKey.currentState!.validate()) {
      final localUser = FragranceUser(
        email: widget.email,
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        gender: gender,
        ageGroup: ageGroup,
        preferredLanguage: preferredLang,
        country: '',
        state: '',
        city: '',
        zipCode: '',
        userClass: '',
      );

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LocationInfoScreen(
          localUser: localUser,
        ),
      ));
    }
  }
}
