import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/controller/karaoke_2co_controller.dart';
import 'package:myapp/components/custom_elevated_button.dart';
import 'package:myapp/components/facility_info.dart';
import 'package:myapp/components/facility_rez.dart';
import 'package:myapp/components/field_rez_header.dart';
import 'package:myapp/pages/my_reservation/my_reservation_menu.dart';

class Karaoke2CORezPage extends StatelessWidget {
  Karaoke2CORezPage(this.date);

  Karaoke2COController _controller = Get.find<Karaoke2COController>();
  DateTime date;

  DateTime absMinToDateTime(int absMin) =>
  DateTime(date.year, date.month, date.day, absMin ~/ 60, absMin % 60);

  Widget _labelText(String text, {TextAlign? textAlign}) => Text(
    "$text",
    textAlign: textAlign ?? TextAlign.center,
    style: TextStyle(
      color: Colors.black54,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget _gridViewHeader() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    child: Row(
      children: List.generate(
        7,
        (i) => Expanded(
          child: Container(
            transform: Matrix4.translationValues(10, 0, 0),
          child: _labelText("${i * 10}", textAlign: TextAlign.end),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          FieldRezHeader(
            today: date,
            facility: Facility(
              icon: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/karaoke.png'
              ),
              name: "2CO 노래방",
              intro: "2 중대 이용 가능",
            )
          ),
          _gridViewHeader(),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  if (index % 7 == 0) {
                    return Container(
                      alignment: Alignment.center,
                      child: _labelText("${(index / 7).floor()}"),
                    );
                  }
                  return Obx(() {
                    int absMin = (index - index ~/ 7 - 1) * 10;
                    RezState state = RezState.ABLE;

                    if(_controller.stAbsTime.value != null &&
                    _controller.endAbsTime.value != null) {
                      if(_controller.stAbsTime.value! <= absMin &&
                      _controller.endAbsTime.value! > absMin) {
                        state = RezState.CHOOSED;
                      }
                    } else if(_controller.endAbsTime.value == null) {
                        if((_controller.stAbsTime.value ?? -1) == absMin)
                          state = RezState.CHOOSED;
                      }

                      if(state == RezState.ABLE) {
                        int cnt = _controller.karaoke2COField.value.rezs!.length;
                        for(int i=0; i<cnt; i++){
                          KaraokeRez rz = _controller.karaoke2COField.value.rezs![i];
                          int stAbsMin = rz.stTime.toAbsMin;
                          int endAbsMin = rz.endTime.toAbsMin;
                          if(stAbsMin <= absMin && endAbsMin > absMin) {
                            state = RezState.EXIST;
                            break;
                          }
                        }
                      }

                      return GestureDetector(
                        onTap: () {
                          if (state == RezState.EXIST) {
                            Get.snackbar("예약불가", "이미 예약된 시간입니다.");
                            return;
                          }

                          if(_controller.stAbsTime.value == null ||
                          _controller.stAbsTime.value != null &&
                          _controller.endAbsTime.value != null) {
                            _controller.stAbsTime.value = absMin;
                            _controller.endAbsTime.value = null;
                            return;
                          }
                          if(_controller.endAbsTime.value == null) {
                            int cnt = _controller.karaoke2COField.value.rezs!.length;
                            for(int i=0; i<cnt; i++) {
                              KaraokeRez rz = _controller.karaoke2COField.value.rezs![i];
                              int stAbsMin = rz.stTime.toAbsMin;
                              int endAbsMin = rz.endTime.toAbsMin;
                            
                              if(_controller.stAbsTime.value! <= stAbsMin && 
                              endAbsMin <= absMin) {
                                Get.snackbar("예약불가", "해당 구간 내 예약일정이 있습니다.");
                                return;
                              }
                            }
                            _controller.endAbsTime.value = absMin + 10;
                            return;
                          }
                        },
                        child: Container(color: state.color),
                      );
                  });
                },
              ),
            ),
            CustromElevatedButton(
              text: "다음",
              onPressed: () {
                DateTime s = absMinToDateTime(_controller.stAbsTime.value ?? 0);
                DateTime e = absMinToDateTime(_controller.endAbsTime.value ?? 0);
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.confirm,
                  title: "2CO 사이버 지식 정보방",
                  text: "$s ~ $e\n예약하시겠습니까?",
                  confirmBtnColor: Colors.pink.shade100,
                  onConfirmBtnTap: () async {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "2CO 사이버 지식 정보방",
                      text: "$s ~ $e\n예약이 성공적으로 완료되었습니다.",
                      confirmBtnColor: Colors.pink.shade100,
                      onConfirmBtnTap: () async {
                        Get.to(MyReservation());
                      }
                    );
                  }
                );
              },
            ),
          ],
        ),
      );
    }
  }

enum RezState {
  EXIST,
  ABLE,
  CHOOSED,
}

extension RezStateExtension on RezState {
  Color get color {
    switch (this) {
      case RezState.EXIST:
        return Colors.pink[50]!;
      case RezState.ABLE:
        return Colors.grey;
      case RezState.CHOOSED:
        return Colors.green[100]!;
    }
  }
}

extension DateTimeExtension on DateTime? {
  int get toAbsMin => this == null ? -1 : this!.hour * 60 + this!.minute;
}