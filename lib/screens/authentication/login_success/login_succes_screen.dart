import 'package:flutter/material.dart';

import 'component/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Success"),
        leading: const SizedBox(),
      ),
      body: const Body(),
    );
  }
}
