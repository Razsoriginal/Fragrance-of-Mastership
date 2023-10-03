import 'package:hive/hive.dart';

part 'user-model.g.dart';

@HiveType(typeId: 4)
class FragranceUser {
  @HiveField(0)
  int? token;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String gender;

  @HiveField(4)
  String ageGroup;

  @HiveField(5)
  String phoneNumber;

  @HiveField(6)
  String preferredLanguage;

  @HiveField(7)
  String country;

  @HiveField(8)
  String state;

  @HiveField(9)
  String city;

  @HiveField(10)
  String zipCode;

  @HiveField(11)
  String userClass;

  FragranceUser({
    this.token,
    required this.name,
    required this.email,
    required this.gender,
    required this.ageGroup,
    required this.phoneNumber,
    required this.preferredLanguage,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.userClass,
  });

  factory FragranceUser.fromMap(Map<String, dynamic> map) {
    return FragranceUser(
      token: map['token'],
      name: map['name'],
      email: map['email'],
      gender: map['gender'],
      ageGroup: map['ageGroup'],
      phoneNumber: map['phoneNumber'],
      preferredLanguage: map['preferredLanguage'],
      country: map['country'],
      state: map['state'],
      city: map['city'],
      zipCode: map['zipCode'],
      userClass: map['userClass'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'name': name,
      'email': email,
      'gender': gender,
      'ageGroup': ageGroup,
      'phoneNumber': phoneNumber,
      'preferredLanguage': preferredLanguage,
      'country': country,
      'state': state,
      'city': city,
      'zipCode': zipCode,
      'userClass': userClass,
    };
  }
}
