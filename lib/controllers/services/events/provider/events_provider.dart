import 'package:flutter/material.dart';

import '../../../../models/appdata/events/events_model.dart';
import '../events_service.dart';

class EventsProvider extends ChangeNotifier {
  late final EventsService eventsService;
  List<EventsModel> _events = [];

  EventsProvider() {
    eventsService = EventsService();
  }

  List<EventsModel> get event => _events;

  Future<void> loadQuizzes() async {
    try {
      final quizzes = await eventsService.fetchQuizzes();
      _events = quizzes;
      notifyListeners();
    } catch (e) {
      print('Error loading quizzes: $e');
    }
  }
}
