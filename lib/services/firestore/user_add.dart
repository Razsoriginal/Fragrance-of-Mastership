import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fragrance/services/firestore/user_repo.dart';

class user_add {
  Future<void> addUserData(String phoneNumber, String name, String email, String? photoUrl, int goog_phn) async {
    if (phoneNumber!= null) {phoneNumber = '+91' + phoneNumber;}

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: email)
        .get();

    if (snapshot.docs.length > 0) {
      DocumentReference ref = snapshot.docs[0].reference;
      if (goog_phn == 1) {
        await ref.update({
          'Name': name,
          'Email': email,
          'Photo': photoUrl,
        }); }
        else {
        await ref.update({
          'Name': name,
          'Email': email,
        });
      } // 1 for google, 2 for phone


    } else {
      FirebaseFirestore.instance.collection('users').add({
        'Name': name,
        'Email': email,
        'Phone': phoneNumber,
        'Photo': photoUrl,
      });
    }

    await UserData().getCurrentUserData(); // calling the get user data inorder to store them in shared prefrences

    print("\nUser data updated to firestore \n");
  }
}