import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/components/info/facility_info.dart';
import 'package:myapp/components/info/facility_rez.dart';
import 'package:myapp/components/info/facility_rez_info.dart';

class SoccerController extends GetxController {
  Rx<SoccerField> soccerField = Rx(SoccerField());
  RxList<SoccerField> soccerFieldList = RxList();

  Rx<int?> stAbsTime = Rx<int?>(null);
  Rx<int?> endAbsTime = Rx<int?>(null);

  @override
  void onInit() {
    Text("단체 이용시설");
    for(int i=0; i<teamFacility.length; i++){
      soccerFieldList.add(
        SoccerField(
          id: i,
          name: teamFacility[i].name,
          rezs: [
            SoccerRez(
              id: 1,
              fieldId: i,
              stTime: DateTime.parse("2021-10-08 12:20"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
            SoccerRez(
              id: 2,
              fieldId: i,
              stTime: DateTime.parse("2021-10-08 14:50"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
          ]
        ),
      );
    }
    super.onInit();
  }
}