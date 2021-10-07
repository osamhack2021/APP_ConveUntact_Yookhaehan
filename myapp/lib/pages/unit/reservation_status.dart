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



class PostNotice extends StatefulWidget {
  @override
  _PostNoticeState createState() => _PostNoticeState();
}

class _PostNoticeState extends State<PostNotice> {

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
          Expanded(
            child: tableBody(
              context,
            ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      Text(
                            "육군 어느 부대",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              //letterSpacing: 0.5,
                              fontSize: 40,
                            ),
                          ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none,
                    size: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      
      SingleChildScrollView tableBody(BuildContext ctx) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 50,
          dividerThickness: 5,
     
          columns: [
            DataColumn(
              label: Text(
                "First Name",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
              tooltip: "This is First Name",
          
            ),
            DataColumn(
              label: Text(
                "Last Name",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
              tooltip: "This is Last Name",
            ),
            DataColumn(
              label: Text(
                "Id",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: true,
        
            ),
            DataColumn(
              label: Text(
                "Email Id",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
             ),
          ],
          rows: emps!
              .map(
                (emp) => DataRow(
                   cells: [
                      DataCell(
                        Text(emp.firstName!),
                                      ),
                      DataCell(
                        Text(emp.firstName!),
                                      ),
                      DataCell(
                        Text('${emp.id}'),
                                    ),
                      DataCell(
                        Text('${emp.email}'),
                      ),
                    ]),
              ) .toList(),
        ),
      ),
    );
  }
}


