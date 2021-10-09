import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Information{
  final String name;
  final String detail;

  Information(
    {required this.name, required this.detail});
}

List<Information> info = [
  Information(
    name: "소속",
    detail: "X군단 X단 X대대"
  ),
  Information(
    name: "중대",
    detail: "X 중대"
  ),
  Information(
    name: "계급",
    detail: "일병"
  ),
  Information(
    name: "성명",
    detail: "홍길동"
  ),
  Information(
    name: "군번",
    detail: "20-11111111"
  ),
  Information(
    name: "이메일",
    detail: "user@gmail.com"
  ),
];