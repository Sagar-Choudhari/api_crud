import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
    required this.city,
    this.id,
  });

  String firstname;
  String lastname;
  int phoneNumber;
  String city;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "phone_number": phoneNumber,
        "city": city,
        "id": id,
      };
}
