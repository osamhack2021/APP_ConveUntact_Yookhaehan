import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/info/facility_info.dart';
import 'package:myapp/components/info/user_info.dart';

class FieldRezHeader extends StatelessWidget {
  FieldRezHeader({ Key? key, required this.today, required this.facility}) : super(key: key);

  DateTime today;
  Facility facility;

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
          //border: Border.all(
            //color: Colors.blue,
            //width: 2,
          //)
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
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "${today.month}월 ${today.day}일\n${facility.name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Color(0x00000000),
                    child: facility.icon,
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