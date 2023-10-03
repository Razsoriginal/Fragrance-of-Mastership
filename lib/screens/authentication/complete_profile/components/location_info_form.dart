import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/default_button.dart';
import 'package:fragrance_of_mastership/components/form_error.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/models/appdata/user/user-model.dart';
import 'package:fragrance_of_mastership/screens/authentication/login_success/login_succes_screen.dart';

import '../../../../../components/custom_suffix_icon.dart';
import '../../../../../components/text-input-field.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../controllers/user/provider/user_provider.dart';

class LocationInfoForm extends StatefulWidget {
  const LocationInfoForm({
    super.key,
    required this.localUser,
  });

  final FragranceUser localUser;

  @override
  State<LocationInfoForm> createState() => _LocationInfoFormState();
}

class _LocationInfoFormState extends State<LocationInfoForm> {
  List<String?> errors = [];
  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextInputField(
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
                saveLocationInfo(context);
              }
            },
          ),
        ],
      ),
    );
  }

  void saveLocationInfo(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    UserProvider userProvider = UserProvider();

    try {
      widget.localUser.country = countryController.text;
      widget.localUser.state = stateController.text;
      widget.localUser.city = cityController.text;
      widget.localUser.zipCode = zipController.text;

      await userProvider.addUserAndSaveInHive(widget.localUser);

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
      await userProvider.init();
    } catch (e) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
