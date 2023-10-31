import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/models/appdata/user/user-model.dart';
import 'package:provider/provider.dart';

import '../../../../components/app_dropdown_input.dart';
import '../../../../components/custom_suffix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../components/text-input-field.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/user/provider/user_provider.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  List<String?> errors = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String gender = "Male";
  String ageGroup = '15 to 25';
  String preferredLang = "English";
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();

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
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      nameController.text = userProvider.user?.name ?? "An Error Occurred";
      phoneNumberController.text = userProvider.user?.phoneNumber ?? '';
      gender = userProvider.user!.gender;
      ageGroup = userProvider.user?.ageGroup ?? '15 to 25';
      preferredLang = userProvider.user?.preferredLanguage ?? 'English';
      countryController.text = userProvider.user?.country ?? '';
      stateController.text = userProvider.user?.state ?? '';
      cityController.text = userProvider.user?.city ?? '';
      zipController.text = userProvider.user?.zipCode ?? '';

      return Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextInputField(
                  controller: nameController,
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
                  controller: phoneNumberController,
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
                    print(gender);
                    setState(() {
                      gender = value;
                      print("After: $gender");
                    });
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                AppDropdownInput(
                  hintText: 'Age Group',
                  options: const [
                    'Less than 15',
                    '15 to 25',
                    '26 to 40',
                    'Above 40'
                  ],
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
                AppTextInputField(
                  controller: countryController,
                  hintText: "Enter your Country",
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: "PLease enter your country");
                      countryController.text = value;
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: "PLease enter your country");
                      return "";
                    } else {
                      removeError(error: "PLease enter your country");
                    }
                    return null;
                  },
                  labelText: 'Country',
                  suffixIcon: const CustomSuffixIcon(svgIcon: fUserSvg),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                AppTextInputField(
                  controller: stateController,
                  hintText: "Enter your State",
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: "Please enter your state");
                      stateController.text = value;
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: "Please enter your state");
                      return "";
                    } else {
                      removeError(error: "Please enter your state");
                    }
                    return null;
                  },
                  labelText: 'State',
                  suffixIcon: const CustomSuffixIcon(svgIcon: fPhoneSvg),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                AppTextInputField(
                  controller: cityController,
                  hintText: "Enter your City",
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: "PLease enter your city");
                      cityController.text = value;
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: "PLease enter your city");
                      return "";
                    } else {
                      removeError(error: "PLease enter your city");
                    }
                    return null;
                  },
                  labelText: 'City',
                  suffixIcon: const CustomSuffixIcon(svgIcon: fUserSvg),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                AppTextInputField(
                  controller: zipController,
                  keyboardType: TextInputType.phone,
                  hintText: "Enter your zipcode",
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: "Please enter your zipcode");
                      zipController.text = value;
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: "Please enter your zipcode");
                      return "";
                    } else {
                      removeError(error: "Please enter your zipcode");
                    }
                    return null;
                  },
                  labelText: 'ZipCode',
                  suffixIcon: const CustomSuffixIcon(svgIcon: fPhoneSvg),
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
                      updateUserData();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  void updateUserData() async {
    final userProvider = context.read<UserProvider>();

    print(gender);

    final updatedUser = FragranceUser(
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
      gender: gender,
      ageGroup: ageGroup,
      preferredLanguage: preferredLang,
      country: countryController.text,
      state: stateController.text,
      city: cityController.text,
      zipCode: zipController.text,
      email: userProvider.user!.email,
      token: userProvider.user!.token,
      userClass: userProvider.user!.userClass,
    );

    try {
      await userProvider.updateUserByEmail(
          userProvider.user!.email, updatedUser);
      await userProvider.init();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User profile updated successfully'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update user profile'),
        ),
      );
    }
  }
}
