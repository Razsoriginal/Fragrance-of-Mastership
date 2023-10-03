import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../models/appdata/insights/insights_model.dart';
import '../hive_service_base.dart';

class InsightsService {
  final String _apiBaseUrl = fApiBaseUrl;
  final HiveServiceBase<InsightModel> _hiveService =
      HiveServiceBase<InsightModel>();
  final String _boxName = 'insights';

  Future<void> init() async {
    await _hiveService.initBox(_boxName);
  }

  Future<List<InsightModel>> fetchInsights() async {
    try {
      final response = await http.get(Uri.parse('$_apiBaseUrl/qna'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> insightsDataList = jsonDecode(response.body);

        final insights = insightsDataList.map((insightsData) {
          try {
            final id = insightsData['_id'] ?? "0";
            final title = insightsData['title'] ?? '';

            final categories =
                (insightsData['categories'] as List<dynamic>).cast<String>();

            final tags = (insightsData['tags'] as List<dynamic>).cast<String>();

            final description = insightsData['description'] ?? '';
            final content = insightsData['content'] ?? '';

            return InsightModel(
              id: id,
              title: title,
              categories: categories,
              tags: tags,
              description: description,
              content: content,
            );
          } catch (e) {
            print('Error mapping qna data: $e');
            return InsightModel(
              id: "0",
              title: 'Error',
              categories: [],
              tags: [],
              description: 'Error mapping qna data',
              content: '',
            );
          }
        }).toList();

        await _saveInsightsInHive(insights);

        return insights;
      } else {
        throw Exception('Failed to fetch insights');
      }
    } catch (e) {
      print('Error fetching insights: $e');
      return _getSavedInsightsFromHive();
    }
  }

  Future<void> _saveInsightsInHive(List<InsightModel> insights) async {
    await _hiveService.box.clear();
    final limitedInsights = insights.take(10).toList();
    for (final qna in limitedInsights) {
      _hiveService.box.put(qna.id, qna);
    }
  }

  Future<List<InsightModel>> _getSavedInsightsFromHive() async {
    return _hiveService.box.values.toList();
  }
}
