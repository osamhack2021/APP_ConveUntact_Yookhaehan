import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final String _urlPrefix = "https://raw.githubusercontent.com/flutter-coder/ui_images/master/messenger";

class Notice{
  final Icon icon;
  final String name;
  final String intro;
  final String date;

  Notice(
    {required this.icon, required this.name, required this.intro, required this.date});
}

List<Notice> me = [
  Notice(
    icon: Icon(Icons.person),
    name: "${_urlPrefix}_me.jpg",
    intro: "ㅎ",
    date: "ㅂ",
  )
];

List<Notice> notice = [
  Notice(
    icon: Icon(Icons.sports_soccer),
    name: "풋살장",
    intro: "금일 풋살장 완충제 충전 작업으로 인해 오전 이용이 제한됩니다.",
    date: "21.09.18 오전",
  ),
  Notice(
    icon: Icon(Icons.sports_basketball),
    name: "농구장",
    intro: "바닥 타일 공사중으로 시설이용이 제한됩니다.",
    date: "21.09.19 ~ 21.09.30",
  ),
];