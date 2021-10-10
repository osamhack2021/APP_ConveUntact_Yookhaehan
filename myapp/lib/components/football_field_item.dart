import 'package:flutter/material.dart';
import 'package:myapp/components/facility_rez_info.dart';

class FootballFieldItem extends StatelessWidget {
  FootballFieldItem({ Key? key, required this.footballField}) : super(key: key);

  FootballField footballField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.pink.shade100,
          ),
        ),
        child: Text(
          footballField.name ?? "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}