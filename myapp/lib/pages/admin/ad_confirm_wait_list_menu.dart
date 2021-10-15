import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:myapp/pages/admin/ad_menu_widget.dart';
import 'package:myapp/pages/admin/ad_notice_list.dart';
import 'package:myapp/pages/admin/ad_confirm_wait_list.dart';
import 'package:myapp/pages/admin/ad_write_comment.dart';

class ADConfirmWaitListPage extends StatefulWidget {
  @override
  _ADConfirmWaitListPageState createState() => _ADConfirmWaitListPageState();
}

class _ADConfirmWaitListPageState extends State<ADConfirmWaitListPage> {
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
            sliderMain: ADConfirmWaitListScreen(),
        ),
      ),
    );
  }
}