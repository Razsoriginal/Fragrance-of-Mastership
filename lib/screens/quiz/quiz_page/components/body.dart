import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/colors.dart';
import 'package:fragrance_of_mastership/controllers/user/provider/user_provider.dart';
import 'package:fragrance_of_mastership/models/appdata/user/user-model.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/quiz/provider/quiz_provider.dart';
import '../../../../models/appdata/quiz/quiz_model.dart';
import '../../../../models/appdata/quiz/quiz_score_model.dart';

class Body extends StatefulWidget {
  final String id;

  const Body({Key? key, required this.id}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> selectedOptions = [];
  late String userAnswer;
  late bool isQuizScoreSubmitted;

  @override
  void initState() {
    super.initState();
    userAnswer = '';
    isQuizScoreSubmitted = false;
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final List<QuizScore> quizScores = quizProvider.quizScores;

    final userProvider = Provider.of<UserProvider>(context);
    final FragranceUser? user = userProvider.user;

    final quiz = quizProvider.getQuizById(widget.id);

    final quizScore = quizProvider.getQuizScoresByQuizId(quiz.id).firstWhere(
          (score) => score.user == user?.id,
          orElse: () => QuizScore(
            quiz: quiz.id,
            user: '',
            questions: [],
            userAnswers: [],
            isCorrect: [],
          ),
        );

    final userId = user?.id;
    final scoreuserId = quizScore.user;

    userAnswer =
        quizScore.userAnswers.isNotEmpty ? quizScore.userAnswers[0] : '';

    isQuizScoreSubmitted = userId == scoreuserId;

    if (selectedOptions.isEmpty) {
      selectedOptions = List.filled(quiz.questions.length, "");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                quiz.description,
                style: TextStyle(fontSize: getProportionateScreenWidth(17)),
              ),
              SizedBox(height: 20),
              ...quiz.questions.asMap().entries.map((entry) {
                final int questionIndex = entry.key;
                final Question question = entry.value;
                final String questionText = question.text;

                String? userAnswer = isQuizScoreSubmitted
                    ? quizScores
                        .firstWhere(
                          (score) => score.quiz == quiz.id,
                          orElse: () => QuizScore(
                            quiz: quiz.id,
                            questions: [],
                            userAnswers: [],
                            isCorrect: [],
                            user: '',
                          ),
                        )
                        .userAnswers[questionIndex]
                    : selectedOptions[questionIndex];
                final bool isCorrect = isQuizScoreSubmitted
                    ? quizScores
                        .firstWhere(
                          (score) => score.quiz == quiz.id,
                          orElse: () => QuizScore(
                            quiz: quiz.id,
                            questions: [],
                            userAnswers: [],
                            isCorrect: [],
                            user: '',
                          ),
                        )
                        .isCorrect[questionIndex]
                    : false;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "${questionIndex + 1}. $questionText",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    if (!isQuizScoreSubmitted)
                      Column(
                        children: question.options.map((option) {
                          return RadioListTile(
                            activeColor: fPrimaryColor,
                            value: option.text,
                            groupValue: selectedOptions[questionIndex],
                            onChanged: (value) {
                              setState(() {
                                selectedOptions[questionIndex] = value!;
                              });
                            },
                            title: Text(
                              option.text,
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    else
                      Row(
                        children: [
                          Text(
                            'Your Answer: $userAnswer',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          if (isCorrect)
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          else
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                        ],
                      ),
                    SizedBox(height: 20),
                  ],
                );
              }).toList(),
              if (!isQuizScoreSubmitted)
                ElevatedButton(
                  onPressed: () {
                    final quizScore = QuizScore(
                      quiz: quiz.id,
                      user: userId!,
                      questions: quiz.questions
                          .map((question) => question.text)
                          .toList(),
                      userAnswers: selectedOptions,
                      isCorrect: List.filled(quiz.questions.length, false),
                    );
                    quizProvider.updateQuizScore(quizScore);
                  },
                  child: const Text('Submit Quiz'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
