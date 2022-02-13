
/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:30
 */

import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/domains/usecases/intf/UCToDo.dart';
import 'package:final_course_app/domains/usecases/intf/UCUsers.dart';
import 'package:final_course_app/presentation/bloc/todo/CubitToDo.dart';
import 'package:final_course_app/presentation/bloc/todo/state/CubitToDoState.dart';
import 'package:final_course_app/presentation/bloc/users/CubitUsers.dart';
import 'package:final_course_app/presentation/widgets/bloc_proxy.dart';
import 'package:final_course_app/presentation/widgets/body_profile.dart';
import 'package:final_course_app/presentation/widgets/circular_p.dart';
import 'package:final_course_app/presentation/widgets/empty_box.dart';
import 'package:final_course_app/presentation/widgets/error_box.dart';
import 'package:final_course_app/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:final_course_app/core/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToDoList extends StatelessWidget {
  static const String routeName = '/todo';
  ToDoList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(title: Text("Задачи"),),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: BlocProxy<CubitToDo>(
                  child: _ToDoContent(id: 1,),
                  bloc: (context, bloc) => CubitToDo(di.sl<UCToDo>()),
                ),
              )),
        ],
      ),
    );
  }
}

class _ToDoContent extends StatefulWidget{
  int id;

  _ToDoContent({required this.id});

  @override
  State<_ToDoContent> createState() => _ToDoContentState();
}

class _ToDoContentState extends State<_ToDoContent> {
  @override
  void initState() {
    call(widget.id);
    super.initState();
  }

  void call(int id){
    context.read<CubitToDo>().loadToDo(id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitToDo, CubitToDoState>(
        builder: (context, snapshot) {
          if (snapshot is CubitToDoStateLoading) {
            return Center(child: CircularP());
          }
          else if (snapshot is CubitToDoStateEmptyList) {
            return EmptyBox(text: "К сожалению раздел пуст((");
          }
          else if (snapshot is CubitToDoStateLoaded<List<ToDo>>) {
            return BodyProfile(data: snapshot.data);
          } else if (snapshot is CubitToDoStateError) {
            return ErrorBox(
                text: snapshot.messgae,
                call: () => call(widget.id)
            );
          }
          return SizedBox.shrink();
        });
  }
}