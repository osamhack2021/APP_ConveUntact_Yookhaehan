import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Facility{
  final Icon icon;
  final String name;
  final String intro;

  Facility(
    {required this.icon, required this.name, required this.intro});
}

List<Facility> teamFacility = [
  Facility(
    icon: Icon(Icons.sports_soccer),
    name: "풋살장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Icon(Icons.sports_basketball),
    name: "농구장",
    intro: "전 중대 이용 가능",
  ),
  Facility(
    icon: Icon(Icons.local_library_rounded),
    name: "독서실",
    intro: "전 중대 이용 가능",
  ),
];

List<Facility> personalFacility = [
  Facility(
    icon: Icon(Icons.computer),
    name: "사이버 지식 정보방",
    intro: "1 중대 이용 가능",
  ),
    Facility(
    icon: Icon(Icons.computer),
    name: "사이버 지식 정보방",
    intro: "2 중대 이용 가능",
  ),
    Facility(
    icon: Icon(Icons.computer),
    name: "사이버 지식 정보방",
    intro: "3 중대 이용 가능",
  ),
];