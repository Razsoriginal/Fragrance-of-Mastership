import 'package:fragrance_of_mastership/models/appdata/quiz/quiz_model.dart';
import 'package:fragrance_of_mastership/models/appdata/quiz/quiz_score_model.dart';

class QuizDataItem {
  final Quiz quiz;
  final QuizScore quizScore;

  QuizDataItem({
    required this.quiz,
    required this.quizScore,
  });
}
