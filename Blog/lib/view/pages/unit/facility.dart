import 'package:flutter/material.dart';

class FacilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("부대 시설 현황"),
            Image.asset(
              'soldier.png',
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
        elevation: 0,
      ),
    );
  }
}
