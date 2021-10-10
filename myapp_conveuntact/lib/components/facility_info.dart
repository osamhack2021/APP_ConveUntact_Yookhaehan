import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Facility{
  final Image icon;
  final String name;
  final String intro;

  Facility(
    {required this.icon, required this.name, required this.intro});
}

List<Facility> teamFacility = [
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soccer.png'),
    name: "풋살장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/basketball.png'),
    name: "농구장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/playground.png'),
    name: "연병장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/football.png'),
    name: "족구장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/table_tennis.png'),
    name: "탁구장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/utility_hall.png'),
    name: "다목적실",
    intro: "전 중대 이용 가능",
  ),
];

List<Facility> personalFacility = [
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    name: "1CO 사이버지식정보방",
    intro: "1 중대 이용 가능",
  ),
    Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    name: "2CO 사이버지식정보방",
    intro: "2 중대 이용 가능",
  ),
    Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    name: "3CO 사이버지식정보방",
    intro: "3 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/karaoke.png'),
    name: "1CO 노래방",
    intro: "1 중대 이용 가능",
  ),
    Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/karaoke.png'),
    name: "2CO 노래방",
    intro: "2 중대 이용 가능",
  ),
    Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/karaoke.png'),
    name: "3CO노래방",
    intro: "3 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/library.png'),
    name: "독서실",
    intro: "전 중대 이용 가능",
  ),
];