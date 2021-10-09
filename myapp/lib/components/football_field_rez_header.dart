import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootballFieldRezHeader extends StatelessWidget {
  FootballFieldRezHeader({ Key? key, required this.today}) : super(key: key);

  DateTime today;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: (){
                    Get.back();
                  },
                ),
                Spacer(),
                Container(
                  width: 36,
                  height: 36,
                  color: Colors.blue,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "${today.month}월 ${today.day}일\n족구장",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 70,
                    height: 70,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "예약시간",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}