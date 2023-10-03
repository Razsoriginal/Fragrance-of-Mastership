import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/colors.dart';
import 'package:fragrance_of_mastership/constants/text_strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/sizes.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri whatsapp = Uri.parse(fWHatsAppLink);
    final Uri email = Uri.parse(fEmailLink);
    final Uri telegram = Uri.parse(fTelegramLink);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Text(
            "Help Center",
            style: headingStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            fHelpCenterMessage,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.mail_outline,
              color: fPrimaryColor,
            ),
            title: const Text("Email"),
            onTap: () async {
              if (!await launchUrl(email,
                  mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $email');
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.chat_outlined,
              color: fPrimaryColor,
            ),
            title: const Text("WhatsApp"),
            onTap: () async {
              if (!await launchUrl(whatsapp,
                  mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $whatsapp');
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.telegram,
              color: fPrimaryColor,
            ),
            title: const Text("Telegram"),
            onTap: () async {
              if (!await launchUrl(telegram,
                  mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $telegram');
              }
            },
          ),
        ],
      ),
    );
  }
}
