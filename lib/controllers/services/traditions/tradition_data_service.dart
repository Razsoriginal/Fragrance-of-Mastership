import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

class TraditionProvider with ChangeNotifier {
  List<dynamic> _traditions = [];
  int _currentPage = 0;
  final int _perPage = 10; // Number of items per page

  List<dynamic> get traditions => _traditions;

  Future<void> fetchData() async {
    String jsonData = await rootBundle.loadString('assets/fom.json');
    _traditions = json.decode(jsonData);
    _currentPage = 0; // Reset to the first page
    notifyListeners();
  }

  List<dynamic> getTopTraditions(int count) {
    if (_traditions.isNotEmpty) {
      var random = Random();
      return List.generate(
          count, (_) => _traditions[random.nextInt(_traditions.length)]);
    } else {
      return [];
    }
  }

  List<dynamic> getTraditionsByVolume([int? volume]) {
    if (volume == 0) {
      return _traditions;
    } else if (_traditions.isNotEmpty) {
      return _traditions
          .where((tradition) => tradition['volume'] == volume)
          .toList();
    } else {
      return [];
    }
  }

  List<dynamic> getCurrentPageTraditions() {
    int startIndex = _currentPage * _perPage;
    int endIndex = startIndex + _perPage;
    if (startIndex < _traditions.length) {
      return _traditions.sublist(startIndex,
          endIndex < _traditions.length ? endIndex : _traditions.length);
    } else {
      return [];
    }
  }

  dynamic getTraditionAtIndex(int index) {
    if (index >= 0 && index < _traditions.length) {
      return _traditions[index];
    } else {
      throw Exception('Invalid index or data not loaded.');
    }
  }

  void nextPage() {
    if ((_currentPage + 1) * _perPage < _traditions.length) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }
}
