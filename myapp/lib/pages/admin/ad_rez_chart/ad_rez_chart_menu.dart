import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:myapp/pages/admin/ad_rez_chart/ad_rez_chart.dart';
import 'package:myapp/pages/admin/ad_facility_modify/ad_facility_modify_page.dart';
import 'package:myapp/pages/admin/ad_menu_widget.dart';

class ADFacilityAnalysisPage extends StatefulWidget {
  @override
  _ADFacilityAnalysisPageState createState() => _ADFacilityAnalysisPageState();
}

class _ADFacilityAnalysisPageState extends State<ADFacilityAnalysisPage> {
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
            appBarColor: Colors.indigo.shade200,
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
            sliderMain: ADFacilityAnalysisScreen(),
        ),
      ),
    );
  }
}