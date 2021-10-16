import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:myapp/pages/admin/ad_menu_widget.dart';
import 'package:myapp/pages/admin/ad_night_manage/company/ad_night_manage_1co_list.dart';

class AD1CONightManagePage extends StatefulWidget {
  @override
  _AD1CONightManagePageState createState() => _AD1CONightManagePageState();
}

class _AD1CONightManagePageState extends State<AD1CONightManagePage> {
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
            sliderMain: ADNightManage1COListScreen(),
        ),
      ),
    );
  }
}