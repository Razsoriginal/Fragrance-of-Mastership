import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/services/events/provider/events_provider.dart';
import '../../../../controllers/user/provider/user_provider.dart';
import '../../../../models/appdata/events/events_model.dart';
import 'eventForm.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.id});

  final String id;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<EventsProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final selectedQuiz = quizProvider.event.firstWhere(
      (quiz) => quiz.id == widget.id,
      orElse: () => EventsModel(
        id: '',
        title: '',
        subject: '',
        fClass: '',
        formLink: '',
        description: '',
        tokenFormField: '',
        lectureLink: '',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        image: '',
      ),
    );

    final int tokenValue = userProvider.user?.token ?? 0;
    final String entryValue = selectedQuiz.tokenFormField;

    return QuizForm(
      url: selectedQuiz.formLink,
      tokenValue: tokenValue,
      entryValue: entryValue,
    );
  }
}
