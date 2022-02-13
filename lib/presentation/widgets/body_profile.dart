/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 23:32
 */

import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/presentation/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class BodyProfile extends StatelessWidget {

  List<ToDo> data;

  BodyProfile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return TodoTile(data:  data[index]);
        }
    );
  }
}
