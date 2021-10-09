import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/components/my_reservation.dart';
import 'package:myapp/components/notice_info.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/page_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyReservationScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        my_reserv.length,
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
                        child: my_reserv[index].image,
                      ),
                      title: Text("${my_reserv[index].facility}", style: TextStyle(color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
                      //subtitle: Text(my_reserv[index].time),
                    ),
                    Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0x00000000),
                        child: Text("좌석"),
                      ),
                      title: Text("${my_reserv[index].seat}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                      //subtitle: Text(my_reserv[index].time),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0x00000000),
                        child: Text("이용 시간"),
                      ),
                      title: Text("${my_reserv[index].time}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                      //subtitle: Text(my_reserv[index].time),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0x00000000),
                        child: Text("승인 여부"),
                      ),
                      title: Text("${my_reserv[index].isconfirm}", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                      //subtitle: Text(my_reserv[index].time),
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
                    // itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
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

  //Container headerBottomBarWidget() {
    //return Container(
      //child: Row(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //children: [//설정 아이콘
          //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
        //],
      //),
    //);
  //}

  Container headerWidget(BuildContext context) => Container(
    color: Colors.pink.shade100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "나의 예약",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 50,
          backgroundColor: Color(0x00000000),
          child: Image.asset(
            '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/reservation_check.png',
            width: 100,
            height: 100
          ),
        ),
      ],
    ),
    );
}