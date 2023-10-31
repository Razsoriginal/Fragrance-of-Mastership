import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../models/appdata/events/events_model.dart';

class EventsService {
  final String _apiBaseUrl = fApiBaseUrl;

  Future<List<EventsModel>> fetchQuizzes() async {
    final response = await http.get(Uri.parse('$_apiBaseUrl/event'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => EventsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
