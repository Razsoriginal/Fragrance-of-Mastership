import 'package:flutter/material.dart';

import '../../../../models/appdata/quiz/quiz_model.dart';
import '../../../../models/appdata/quiz/quiz_score_model.dart';
import '../quiz_service.dart';

class QuizProvider extends ChangeNotifier {
  late final QuizService quizService;
  List<Quiz> _quizzes = [];
  List<QuizScore> _quizScores = [];

  QuizProvider() {
    quizService = QuizService();
    loadQuizData();
  }

  List<Quiz> get quizzes => _quizzes;

  List<QuizScore> get quizScores => _quizScores;

  Future<void> loadQuizData() async {
    try {
      _quizzes = await quizService.fetchQuizzes();
      _quizScores = await quizService.fetchQuizScores();
      notifyListeners();
    } catch (e) {
      print('Error loading quiz data: $e');
    }
  }

  Quiz getQuizById(String id) {
    return _quizzes.firstWhere((quiz) => quiz.id == id);
  }

  List<QuizScore> getQuizScoresByQuizId(String quizId) {
    return _quizScores.where((score) => score.quiz == quizId).toList();
  }

  Future<void> updateQuizScore(QuizScore quizScore) async {
    await quizService.updateQuizScore(quizScore);
    _quizScores = await quizService.fetchQuizScores();
    try {
      await quizService.updateQuizScore(quizScore);
      _quizScores = await quizService.fetchQuizScores();
      notifyListeners();
    } catch (e) {
      print('Error updating quiz score: $e');
    }
  }
}
