import 'dart:io';

class UserInfo {
  String email;
  String password;
  String username;
  File? image;

  UserInfo(
      {required this.email,
      required this.password,
      this.username = '',
      this.image});
}
