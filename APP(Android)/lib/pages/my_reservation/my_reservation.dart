import 'package:flutter/widgets.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/my_reservation.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:intl/intl.dart';
import 'package:myapp/pages/reservation/reservation_menu.dart';
import 'package:get/get.dart';

class MyReservationScreen extends StatefulWidget {
  @override
  MyReservationList createState() => MyReservationList();
}
class MyReservationList extends State<MyReservationScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  // ReservationController r = Get.put(ReservationController());
  // UserController u = Get.put(UserController());
  
  @override
  Widget build(BuildContext context) {
    //1. r.findByUid(u.principal.value.uid!);
    final pages = List.generate(
        my_reserv.length,
        //2. r.reservations.value.length,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white70,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0x00000000),
                        child: my_reserv[index].facility.icon,
                        //3. child: ${r.reservations[index].facility_picture},
                      ),
                      title: Text("${my_reserv[index].facility.name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
                      //3. title: Text("${r.reservations[index].facility_name}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(
                        "예약자\n대표",
                        style: TextStyle(
                          color: Colors.pink.shade100,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left
                      ),
                      title: Text(
                        "${my_reserv[index].user.rank} ${my_reserv[index].user.name}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                      //3. title: Text("${r.reservations[index].reason}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      leading: Text(
                        "이용\n시간",
                        style: TextStyle(
                          color: Colors.pink.shade100,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left
                      ),
                      title: Text(
                        "${new DateFormat.yMMMd().format(my_reserv[index].start)}\n${new DateFormat.Hm().format(my_reserv[index].start)} ~ ${new DateFormat.Hm().format(my_reserv[index].end)}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right
                      ),
                      //3. title: Text("${r.reservations[index].start} ~ ${r.reservations[index].end}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            title: "${my_reserv[index].facility}",
                            text: "예약이 취소되었습니다.",
                            confirmBtnColor: Colors.indigo.shade200,
                          );
                          my_reserv.removeAt(index);
                        });
                      },
                      child: Text('예약 취소'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                      ),
                    ),
                  ],
                ),
              ),
            )
          );
    return DraggableHome(
      title: Text("나의 예약"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: my_reserv.length,
                    itemBuilder: (_, index) {
                      return pages[index % my_reserv.length];
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller, // PageController
                  count: my_reserv.length,
                  effect: WormEffect(), // your preferred effect
                  onDotClicked: (index){  
              
                  } 
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container headerWidget(BuildContext context) => Container(
    color: Colors.pink.shade100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "나의 예약",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/reservation_check.png',
                width: 80,
                height: 80
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustromElevatedButton(
              text: "예약 하기",
              onPressed: () {
                Get.to(ReservationPage());
              },
            ),
          ],
        ),
      ]
    ),
  );
}