import 'package:flutter/foundation.dart';

import '../../../models/appdata/user/user-model.dart';
import '../user_service.dart';

class UserProvider extends ChangeNotifier {
  late final FragranceUserService _userService;

  UserProvider() {
    _userService = FragranceUserService();
    init();
  }

  FragranceUser? _user;

  Future<void> init() async {
    await _userService.init();
    _user = _userService.getSavedUser();
    notifyListeners();
  }

  FragranceUser? get user => _user;

  Future<void> fetchUserByEmail(String email) async {
    await _userService.fetchUserByEmail(email);
    _user = _userService.getSavedUser();
    notifyListeners();
  }

  Future<void> updateUserByEmail(
      String email, FragranceUser updatedUser) async {
    await _userService.updateUserByEmail(email, updatedUser);
    _user = _userService.getSavedUser();
    notifyListeners();
  }

  Future<void> addUserAndSaveInHive(FragranceUser user) async {
    await _userService.addUserAndSaveInHive(user);
    _user = _userService.getSavedUser();
    notifyListeners();
  }
}
