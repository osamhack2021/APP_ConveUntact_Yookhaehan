import 'dart:ffi';
import 'dart:html';

import 'package:get/state_manager.dart';
import 'package:myapp/components/facility_rez.dart';
import 'package:myapp/components/football_field.dart';

class FootballController extends GetxController {
  Rx<FootballField> footballField = Rx(FootballField());
  RxList<FootballField> footballFieldList = RxList();

  Rx<int?> stAbsTime = Rx<int?>(null);
  Rx<int?> endAbsTime = Rx<int?>(null);

  @override
  void onInit() {
    for(int i=1; i<10; i++){
      footballFieldList.add(
        FootballField(
          id: i,
          name: "족구장$i",
          rezs: [
            FootballRez(
              id: 1,
              fieldId: i,
              stTime: DateTime.parse("2021-10-08 12:20"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
            FootballRez(
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