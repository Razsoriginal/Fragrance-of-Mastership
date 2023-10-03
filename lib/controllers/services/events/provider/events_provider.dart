import 'package:flutter/material.dart';

import '../../../../models/appdata/events/events_model.dart';
import '../events_service.dart';

class EventsProvider extends ChangeNotifier {
  late final EventsService quizService;
  List<EventsModel> _quizzes = [];

  EventsProvider() {
    quizService = EventsService();
  }

  List<EventsModel> get quizzes => _quizzes;

  Future<void> loadQuizzes() async {
    try {
      final quizzes = await quizService.fetchQuizzes();
      _quizzes = quizzes;
      notifyListeners();
    } catch (e) {
      print('Error loading quizzes: $e');
    }
  }
}
