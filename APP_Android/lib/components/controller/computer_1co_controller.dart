import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/components/info/facility_info.dart';
import 'package:myapp/components/info/facility_rez.dart';
import 'package:myapp/components/info/facility_rez_info.dart';

class Computer1COController extends GetxController {
  Rx<ComputerField> computer1COField = Rx(ComputerField());
  RxList<ComputerField> computer1COFieldList = RxList();

  Rx<int?> stAbsTime = Rx<int?>(null);
  Rx<int?> endAbsTime = Rx<int?>(null);

  @override
  void onInit() {
    Text("1CO 사이버 지식 정보방");
    for(int i=0; i<personalFacility.length; i++){
      computer1COFieldList.add(
        ComputerField(
          id: i,
          name: personalFacility[i].name,
          rezs: [
            ComputerRez(
              id: 1,
              fieldId: i,
              stTime: DateTime.parse("2021-10-08 12:20"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
            ComputerRez(
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