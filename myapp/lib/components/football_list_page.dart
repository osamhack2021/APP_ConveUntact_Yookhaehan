import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/football_controller.dart';
import 'package:myapp/components/football_field_item.dart';
import 'package:myapp/components/football_rez_page.dart';

class FootballListPage extends StatefulWidget {
  FootballListPage ({ Key? key }) : super(key: key);

  @override
  _FootballListPageState createState() => _FootballListPageState();
}

class _FootballListPageState extends State<FootballListPage> {
  FootballController _controller = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("족구장 목록"),
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _controller.footballFieldList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _controller.footballField.value =
                _controller.footballFieldList[index];
                _controller.stAbsTime.value = null;
                _controller.endAbsTime.value = null;
                Get.to(() => FootballRezPage(DateTime.now()));
              },
              child: FootballFieldItem(
                footballField: _controller.footballFieldList[index],
              ),
            );
          },
        )
      ),
    );
  }
}