import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../models/appdata/user/user-model.dart';

class UserRegistrationService {
  final String apiUrl = 'http://localhost:3000';

  Future<void> registerUser(FragranceUser user) async {
    try {
      final userMap = {
        'name': user.name,
        'email': user.email,
        'gender': user.gender,
        'ageGroup': user.ageGroup,
        'phoneNumber': user.phoneNumber,
        'preferredLanguage': user.preferredLanguage,
        'country': user.country,
        'state': user.state,
        'city': user.city,
        'zipCode': user.zipCode,
      };

      final response = await http.post(
        '$apiUrl/user' as Uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userMap),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // save user data in hive
        final userBox = await Hive.openBox<FragranceUser>('userBox');
        final hiveUser = FragranceUser.fromMap(responseData);
        userBox.put('user', hiveUser);
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
