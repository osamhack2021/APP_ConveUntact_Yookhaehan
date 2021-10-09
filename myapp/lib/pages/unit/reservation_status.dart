import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:intl/intl.dart';
import 'package:myapp/component/custom_textarea.dart';
import 'package:myapp/pages/component/appbar.dart';
import 'package:myapp/size.dart';
import 'package:myapp/util/validator_util.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class Employee {
  String? firstName;
  String? lastName;
  int? id;
  String? email;

  Employee({this.firstName, this.lastName, this.id, this.email});

  static List<Employee> getUsers() {
    return <Employee>[
      Employee(
          firstName: "Shubham",
          lastName: "B",
          id: 1001,
          email: "shubham.b@walkingtree.tech"),
      Employee(
          firstName: "HariKrishna",
          lastName: "S",
          id: 1001,
          email: "harikrishna.s@walkingtree.tech"),
      Employee(
          firstName: "Vishnu",
          lastName: "P",
          id: 1001,
          email: "vishnu.p@walkingtree.tech"),
      Employee(
          firstName: "Suman",
          lastName: "R",
          id: 1001,
          email: "Suman.r@walkingtree.tech "),
      Employee(
          firstName: "Prashanth",
          lastName: "K",
          id: 1001,
          email: "Prashanth.k@walkingtree.tech ")
    ];
  }
}

class ReservationStatus extends StatefulWidget {
  @override
  _ReservationStatusState createState() => _ReservationStatusState();
}

class _ReservationStatusState extends State<ReservationStatus> {
  List<Employee>? emps;

  @override
  void initState() {
    emps = Employee.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("write Notice"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
          child: custumTable(),
        ),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  Container headerWidget(BuildContext context) => Container(
        color: Colors.indigo[200],
        child: Column(
          children: [
            CustomAppbar(title: "공지사항 작성"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "9월 19일",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              //letterSpacing: 0.5,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            "월요일",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              //letterSpacing: 0.5,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "부대명",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 0.5,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  DataTable custumTable() {
    return DataTable(
      dividerThickness: 2,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            '상태',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      
        DataColumn(
          label: Text(
            '계급',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            '이름',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            '장소',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '??',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '일병',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '홍길동',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '3층 사지방',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '??',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '일병',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '홍길동',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '3층 사지방',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '??',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '일병',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '홍길동',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '3층 사지방',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '??',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '일병',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '홍길동',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '독서실',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '??',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '일병',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '홍길동',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '독서실',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              '??',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '일병',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '홍길동',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '독서실',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ],
    );
  }
}
