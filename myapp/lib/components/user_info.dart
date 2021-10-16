import 'package:flutter/material.dart';

class User{
  Image? profile;
  String unit;
  String company;
  String rank;
  String name;
  String id;
  String email;
  String pw;

  User({
    this.profile,
    required this.unit,
    required this.company,
    required this.rank,
    required this.name,
    required this.id,
    required this.email,
    required this.pw,
  });
}

List<User> userInfo = [
  User(
    profile: null,//Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soldier.png'),
    unit: "X군단 X단 X대대",
    company: "X 중대",
    rank: "일병",
    name: "홍길동",
    id: "20-11111111",
    email: "user@gmail.com",
    pw: "1234"
  ),
]; 