import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/user/provider/user_provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userProvider.user?.name ?? "Error",
                style: headingStyle,
              ),
              Text(userProvider.user?.email ?? "Error (Update Your Profile)"),
            ],
          ),
        );
      },
    );
  }
}
