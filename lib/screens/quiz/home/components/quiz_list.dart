import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/quiz/quiz_page/quiz_page.dart';

import '../../../../constants/sizes.dart';
import 'info_card.dart';

class QuizList extends StatelessWidget {
  const QuizList({
    super.key,
    required this.date,
    required this.subject,
    required this.quizClass,
    required this.title,
    required this.description,
    required this.id,
  });

  final String date;
  final String subject;
  final String quizClass;
  final String title;
  final String description;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuizPage(
                      id: id,
                    ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                InfoCard(
                  text: date,
                ),
                InfoCard(
                  text: subject,
                ),
                InfoCard(text: quizClass),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(description),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
