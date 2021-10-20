import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/components/info/facility_info.dart';
import 'package:myapp/components/info/facility_rez.dart';
import 'package:myapp/components/info/facility_rez_info.dart';

class PlaygroundController extends GetxController {
  Rx<Playground> playground = Rx(Playground());
  RxList<Playground> playgroundList = RxList();

  Rx<int?> stAbsTime = Rx<int?>(null);
  Rx<int?> endAbsTime = Rx<int?>(null);

  @override
  void onInit() {
    Text("단체 이용시설");
    for(int i=0; i<teamFacility.length; i++){
      playgroundList.add(
        Playground(
          id: i,
          name: teamFacility[i].name,
          rezs: [
            PlaygroundRez(
              id: 1,
              fieldId: i,
              stTime: DateTime.parse("2021-10-08 12:20"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
            PlaygroundRez(
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