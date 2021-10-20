import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Notice{
  final Image icon;
  final String name;
  final String intro;
  final String date;

  Notice(
    {required this.icon, required this.name, required this.intro, required this.date});
}

List<Notice> notice = [
  Notice(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/soccer.png'),
    name: "풋살장",
    intro: "금일 풋살장 완충제 충전 작업으로 인해 오전 이용이 제한됩니다.",
    date: "21.09.18 오전",
  ),
  Notice(
    icon: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/APP_Android/lib/icons/basketball.png'),
    name: "농구장",
    intro: "바닥 타일 공사중으로 시설이용이 제한됩니다.",
    date: "21.09.19 ~ 21.09.30",
  ),
];