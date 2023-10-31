import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/screens/home/home_page/components/hero_banner.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../controllers/services/quiz/provider/quiz_provider.dart';
import '../../../../models/appdata/quiz/quiz_model.dart';
import '../../../../screens/quiz/home/components/quiz_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const HeroBanner(
          heroTitle: 'Engage Your Intellect',
          herSubTitle: 'Islamic Insights',
          heroGradient: fCardGradientColor,
        ),
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            if (quizProvider.quizzes.isEmpty) {
              quizProvider.loadQuizData();
              return const Center(child: CircularProgressIndicator());
            } else {
              return buildQuizListWidgets(quizProvider.quizzes);
            }
          },
        ),
      ],
    );
  }

  Widget buildQuizListWidgets(List<Quiz> quizzes) {
    return Column(
      children: quizzes.map((quiz) {
        return QuizList(
          date: quiz.startDate.toLocal().toString().split(' ')[0],
          subject: quiz.subject,
          quizClass: quiz.quizClass,
          title: quiz.title,
          description: quiz.description,
          id: quiz.id,
        );
      }).toList(),
    );
  }
}
