import 'package:flutter/material.dart';

class ADHomePageItem extends StatelessWidget {
  ADHomePageItem({ Key? key, required this.homePageCard}) : super(key: key);

  HomePageCard homePageCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.blueGrey.shade200,
          ),
        ),
        child: Row(
          children: [
            Text(
              homePageCard.name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "$homePageCard.num건 존재",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageCard {
  String name;
  int? num;

  HomePageCard({required this.name, this.num});
}