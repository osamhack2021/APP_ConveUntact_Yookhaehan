import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:myapp/pages/menu/menu_widget.dart';
import 'package:myapp/pages/reservation/facility/computer/facility_computer.dart';
import 'package:myapp/pages/reservation/facility/football/facility_football.dart';
import 'package:myapp/pages/reservation/facility/karaoke/facility_1co_karaoke.dart';
import 'package:myapp/pages/reservation/reservation.dart';

class Reserv1Computer extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Reserv1Computer> {
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();
  late String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SliderMenuContainer(
            appBarColor: Colors.pink.shade100,
            key: _key,
            sliderMenuOpenSize: 200,
            slideDirection: SlideDirection.RIGHT_TO_LEFT,
            drawerIconColor: Colors.white,
            title: Text(
              'ConveUntact',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            sliderMenu: MenuWidget(
              onItemClick: (title) {
                _key.currentState!.closeDrawer();
                setState(() {
                  this.title = title;
                });
              },
            ),
            sliderMain: RezComputerScreen()),
      ),
    );
  }
}