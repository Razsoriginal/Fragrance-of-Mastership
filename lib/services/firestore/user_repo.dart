import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;

  CurrentUser({required this.name, required this.email, required this.phone, required this.photo});
}
class UserData {
  Future<void> getCurrentUserData() async {
    final uemail = FirebaseAuth.instance.currentUser?.email;
    final phonenumber = FirebaseAuth.instance.currentUser?.phoneNumber;
    if (uemail != null || phonenumber != null) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('Email', isEqualTo: uemail)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final userDocument = querySnapshot.docs.first;
        final data = userDocument.data();
        final name = data['Name'] as String?;
        final email = data['Email'] as String?;
        final phone = data['Phone'] as String?;
        final photo = data['Photo'] as String?;
        await saveUser(name, email, phone, photo);
      } else {
        // Handle the case where the document does not exist
        throw Exception('User document does not exist');
      }
    } else {
      // Handle the case where the user is not signed in
      throw Exception('User is not signed in');
    }
  }

  Future<void> saveUser(String? name, String? email, String? phone, String? photo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name ?? '');
    await prefs.setString('email', email ?? '');
    await prefs.setString('phone', phone ?? '');
    await prefs.setString('photo', photo ?? '');
  }

  Future<CurrentUser> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final phone = prefs.getString('phone');
    final photo = prefs.getString('photo');
    return CurrentUser(
      name: name,
      email: email,
      phone: phone,
      photo: photo,
    );
  }
}
