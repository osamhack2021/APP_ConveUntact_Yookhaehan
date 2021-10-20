import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Facility{
  final Image icon;
  final String name;
  final String intro;
  List<Facility>? company;

  Facility(
    {required this.icon, required this.name, required this.intro, this.company});
}

List<Facility> teamFacility = [
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/soccer.png'),
    name: "풋살장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/basketball.png'),
    name: "농구장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/library.png'),
    name: "독서실",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/playground.png'),
    name: "연병장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/football.png'),
    name: "족구장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/utility_hall.png'),
    name: "다목적실",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/table_tennis.png'),
    name: "탁구장",
    intro: "전 중대 이용 가능",
  ),
];

List<Facility> personalFacility = [
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/computer.png'),
    name: "사이버 지식 정보방",
    intro: "중대별 이용 가능",
    company: [
      Facility(
        icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/computer.png'),
        name: "1CO 사이버 지식 정보방",
        intro: "1중대 이용 가능"
      ),
      Facility(
        icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/computer.png'),
        name: "2CO 사이버 지식 정보방",
        intro: "2중대 이용 가능"
      ),
      Facility(
        icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/computer.png'),
        name: "3CO 사이버 지식 정보방",
        intro: "3중대 이용 가능"
      )
    ]
  ),
  Facility(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/karaoke.png'),
    name: "노래방",
    intro: "중대별 이용 가능",
    company: [
      Facility(
        icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/karaoke.png'),
        name: "1CO 노래방",
        intro: "1중대 이용 가능"
      ),
      Facility(
        icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/karaoke.png'),
        name: "2CO 노래방",
        intro: "2중대 이용 가능"
      ),
      Facility(
        icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/karaoke.png'),
        name: "3CO 노래방",
        intro: "3중대 이용 가능"
      )
    ]
  ),
];