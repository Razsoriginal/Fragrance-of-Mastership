class Option {
  String text;
  bool isCorrect;

  Option({
    required this.text,
    required this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }
}

class Question {
  String text;
  List<Option> options;
  String explanation;

  Question({
    required this.text,
    required this.options,
    required this.explanation,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['text'] as String,
      options: (json['options'] as List)
          .map((optionJson) => Option.fromJson(optionJson))
          .toList(),
      explanation: json['explanation'] as String,
    );
  }
}

class Quiz {
  String id;
  String title;
  List<Question> questions;
  String subject;
  String quizClass;
  String description;
  String imageLink;
  DateTime startDate;
  DateTime endDate;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    required this.subject,
    required this.quizClass,
    required this.description,
    required this.imageLink,
    required this.startDate,
    required this.endDate,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['_id'] as String,
      title: json['title'] as String,
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
      subject: json['subject'] as String,
      quizClass: json['quizClass'] as String,
      description: json['description'] as String,
      imageLink: json['imageLink'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }
}
