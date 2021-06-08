import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int idUser;
  String email;
  String pass;

  UserModel({
    this.idUser,
    this.email,
    this.pass
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    idUser: json['idUser'] as int,
    email: json['email'] as String,
    pass: json['pass'] as String
  );
  
  Map<String, dynamic> toJson() => {
    "idUser": idUser,
    "email": email,
    "pass": pass
  };

}