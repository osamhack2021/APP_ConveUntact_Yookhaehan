import 'package:flutter/material.dart';
import 'package:myapp/components/notice_info.dart';

class NoticeCard extends StatelessWidget {
  final Notice notice;

  const NoticeCard({required this.notice});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
     backgroundImage: NetworkImage(notice.name),
      ),
      title: Text(
        notice.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        notice.intro,
        style: TextStyle(fontSize: 12),
      ),
      //contentPadding: EdgeInsets.all(0),
    );
  }
}