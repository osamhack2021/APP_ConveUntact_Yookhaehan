import 'package:flutter/widgets.dart';

class Reservation{
  final Image image;
  final String facility;
  final String seat;
  final String time;
  final String isconfirm;

  Reservation(
    {required this.image, required this.facility, required this.seat, required this.time, required this.isconfirm});
}

List<Reservation> my_reserv = [
  Reservation(
    image: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    facility: "1CO 사이버지식정보방",
    seat: "1번 PC",
    time: "17:30 ~ 19:30",
    isconfirm: "승인 대기중" 
  ),
  Reservation(
    image: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soccer.png'),
    facility: "풋살장",
    seat: "풋살장",
    time: "17:30 ~ 19:30",
    isconfirm: "승인 완료" 
  ),
  Reservation(
    image: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/basketball.png'),
    facility: "농구장",
    seat: "농구장",
    time: "17:30 ~ 19:30",
    isconfirm: "승인 거절됨" 
  ),
];