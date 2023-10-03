import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/image_strings.dart';
import '../constants/sizes.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          fErrorSvg,
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Flexible(
          child: Text(
            error,
            overflow:
                TextOverflow.visible, // You can adjust the overflow behavior
          ),
        ),
      ],
    );
  }
}
