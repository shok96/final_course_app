import 'package:final_course_app/models/users/User.dart';
import 'package:flutter/material.dart';

class UsersTile extends StatelessWidget {
  User data;

  UsersTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("${data.name ?? ""}"),
        trailing: CircleAvatar(child: Icon(Icons.person),));
  }
}
