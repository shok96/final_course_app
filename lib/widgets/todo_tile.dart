import 'package:final_course_app/models/ToDo.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {

  ToDo data;

  TodoTile({Key? key, required this.data}) : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState(data: data);
}

class _TodoTileState extends State<TodoTile> {

  ToDo data;

  _TodoTileState({required this.data}){
    isChecked = data.completed ?? false;
  }

  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        tileColor: Color(data.hashCode).withOpacity(0.3),
        subtitle: Divider(),
        title: Text("${data.title ?? ""}"),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (value){
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
      ),
    );
  }
}
