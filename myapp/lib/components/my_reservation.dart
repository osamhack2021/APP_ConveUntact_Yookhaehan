class Reservation{
  final String facility;
  final String seat;
  final String time;
  final String isconfirm;

  Reservation(
    {required this.facility, required this.seat, required this.time, required this.isconfirm});
}

List<Reservation> my_reserv = [
  Reservation(
    facility: "1CO 사이버지식정보방",
    seat: "1번 PC",
    time: "17:30 ~ 19:30",
    isconfirm: "승인 대기중" 
  ),
  Reservation(
    facility: "풋살장",
    seat: "null",
    time: "17:30 ~ 19:30",
    isconfirm: "승인 완료" 
  ),
  Reservation(
    facility: "농구장",
    seat: "null",
    time: "17:30 ~ 19:30",
    isconfirm: "승인 거절됨" 
  ),
];