class QuizScore {
  String quiz; // Reference to the quiz schema
  String user; // Reference to the User schema
  List<String> questions;
  List<String> userAnswers;
  List<bool> isCorrect;

  QuizScore({
    required this.quiz,
    required this.user,
    required this.questions,
    required this.userAnswers,
    required this.isCorrect,
  });

  factory QuizScore.fromJson(Map<String, dynamic> json) {
    return QuizScore(
      quiz: json['quiz'] as String,
      user: json['user'] as String,
      questions: (json['questions'] as List).map((e) => e as String).toList(),
      userAnswers:
          (json['userAnswers'] as List).map((e) => e as String).toList(),
      isCorrect: (json['isCorrect'] as List)
          .map((e) => e is bool ? e : false)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quiz': quiz,
      'user': user,
      'questions': questions,
      'userAnswers': userAnswers,
      'isCorrect': isCorrect,
    };
  }
}
