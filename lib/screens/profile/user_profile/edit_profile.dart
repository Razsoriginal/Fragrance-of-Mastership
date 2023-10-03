import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/screens/profile/user_profile/components/edit_profile_form.dart';

import '../../../constants/constants.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Text(
                "Edit Profile",
                style: headingStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              const EditProfileForm(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
