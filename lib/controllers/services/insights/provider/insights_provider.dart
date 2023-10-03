import 'package:flutter/foundation.dart';

import '../../../../models/appdata/insights/insights_model.dart';
import '../insights_service.dart';

class InsightsProvider extends ChangeNotifier {
  late final InsightsService _insightsService;

  InsightsProvider() {
    _insightsService = InsightsService();
    init();
  }

  List<InsightModel> _insights = [];

  Future<void> init() async {
    await _insightsService.init();
    _insights = await _insightsService.fetchInsights();
    notifyListeners();
  }

  List<InsightModel> get insights => _insights;

  Future<void> refreshInsights() async {
    _insights = await _insightsService.fetchInsights();
    notifyListeners();
  }
}
