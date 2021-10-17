import 'package:flutter/widgets.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:myapp/components/user_info.dart';

class Reservation{
  final Facility facility;
  final User user;
  String? seat;
  DateTime start;
  DateTime end;

  Reservation(
    {required this.facility, required this.user, this.seat, required this.start, required this.end});
}

List<Reservation> my_reserv = [
  //Reservation(
    //image: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
    //facility: "1CO 사이버지식정보방",
    //user: myInfo[0],
    //time: "17:30 ~ 19:30",
  //),
];