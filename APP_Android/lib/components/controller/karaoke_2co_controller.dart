import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/components/info/facility_info.dart';
import 'package:myapp/components/info/facility_rez.dart';
import 'package:myapp/components/info/facility_rez_info.dart';

class Karaoke2COController extends GetxController {
  Rx<KaraokeField> karaoke2COField = Rx(KaraokeField());
  RxList<KaraokeField> karaoke2COFieldList = RxList();

  Rx<int?> stAbsTime = Rx<int?>(null);
  Rx<int?> endAbsTime = Rx<int?>(null);

  @override
  void onInit() {
    Text("2CO 사이버 지식 정보방");
    for(int i=0; i<personalFacility.length; i++){
      karaoke2COFieldList.add(
        KaraokeField(
          id: i,
          name: personalFacility[i].name,
          rezs: [
            KaraokeRez(
              id: 1,
              fieldId: i,
              stTime: DateTime.parse("2021-10-08 12:20"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
            KaraokeRez(
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