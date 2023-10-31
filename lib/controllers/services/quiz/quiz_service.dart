import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../models/appdata/quiz/quiz_model.dart';
import '../../../models/appdata/quiz/quiz_score_model.dart';

class QuizService {
  final String _apiBaseUrl = fApiBaseUrl;

  Future<List<Quiz>> fetchQuizzes() async {
    final response = await http.get(Uri.parse('$_apiBaseUrl/quiz'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Quiz.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load quiz');
    }
  }

  Future<List<QuizScore>> fetchQuizScores() async {
    final response = await http.get(Uri.parse('$_apiBaseUrl/quizScore'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<QuizScore> quizScores =
          jsonData.map((json) => QuizScore.fromJson(json)).toList();

      return quizScores;
    } else {
      throw Exception('Failed to load quiz scores');
    }
  }

  Future<void> updateQuizScore(QuizScore quizScore) async {
    final response = await http.post(
      Uri.parse('$_apiBaseUrl/quizScore'),
      body: json.encode(quizScore.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      final res = response.statusCode;
      print(res);
      throw Exception('Failed to update quiz score');
    }
  }
}
