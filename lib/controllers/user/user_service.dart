import 'dart:convert';

import 'package:fragrance_of_mastership/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../models/appdata/user/user-model.dart';
import '../services/hive_service_base.dart';

class FragranceUserService {
  final String _apiBaseUrl = fApiBaseUrl;

  final HiveServiceBase<FragranceUser> _hiveService =
      HiveServiceBase<FragranceUser>();
  final String _boxName = 'fragranceUser';

  Future<void> init() async {
    await _hiveService.initBox(_boxName);
  }

  Future<void> fetchUserByEmail(String email) async {
    final response =
        await http.get(Uri.parse('$_apiBaseUrl/user/email/$email'));

    if (response.statusCode == 200) {
      _hiveService.box.clear();

      final userData = jsonDecode(response.body);
      final user = FragranceUser.fromMap(userData);
      final userid = user.id;
      print("User id: $userid");
      _hiveService.box.put(user.email, user);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  Future<void> updateUserByEmail(
      String email, FragranceUser updatedUser) async {
    final response = await http.put(
      Uri.parse('$_apiBaseUrl/user/email/$email'),
      body: jsonEncode(updatedUser.toMap()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      await _hiveService.box.put(updatedUser.email, updatedUser);
    } else {
      throw Exception('Failed to update user data');
    }
  }

  Future<void> addUserAndSaveInHive(FragranceUser user) async {
    try {
      final response = await http.post(
        Uri.parse('$_apiBaseUrl/user'),
        body: jsonEncode(user.toMap()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await _hiveService.box.clear();
        final userData = jsonDecode(response.body);
        final addedUser = FragranceUser.fromMap(userData);
        await _hiveService.box.put(addedUser.email, addedUser);
      } else {
        print('HTTP Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception('Failed to add user');
      }
    } catch (e) {
      print('Error adding user: $e');
      throw Exception('Failed to add user: $e');
    }
  }

  FragranceUser? getSavedUser() {
    if (_hiveService.box.isNotEmpty) {
      final FragranceUser? user = _hiveService.box.getAt(0);
      final userId = user?.id;
      print("UserIfd from hive: $userId");
      return user;
    }
    return null;
  }
}
