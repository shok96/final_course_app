/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 21:48
 */

import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/domains/usecases/intf/UCToDo.dart';
import 'package:final_course_app/domains/usecases/intf/UCUsers.dart';
import 'package:final_course_app/presentation/bloc/todo/CubitToDo.dart';
import 'package:final_course_app/presentation/bloc/todo/state/CubitToDoState.dart';
import 'package:final_course_app/presentation/bloc/users/CubitUsers.dart';
import 'package:final_course_app/presentation/bloc/users/state/CubitUsersState.dart';
import 'package:final_course_app/presentation/widgets/bloc_proxy.dart';
import 'package:final_course_app/presentation/widgets/body_profile.dart';
import 'package:final_course_app/presentation/widgets/circular_p.dart';
import 'package:final_course_app/presentation/widgets/empty_box.dart';
import 'package:final_course_app/presentation/widgets/error_box.dart';
import 'package:final_course_app/presentation/widgets/head_profile.dart';
import 'package:final_course_app/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_course_app/core/di.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';

  Color color;
  IconData icon;
  String img;
  int? id;

  Profile({Key? key, required this.img, required this.icon, required this.color, this.id = 1}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: navigationDrawer(),
      appBar: AppBar(title: Text("Профиль"), backgroundColor: color),
      body:Column(
                    children: [
                      Container(
                      width: double.infinity,

                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: BlocProxy<CubitUsers>(
                          child: _HeadToDOContent(id: id!, icon: icon, color: color, img: img),
                          bloc: (context, bloc) => CubitUsers(di.sl<UCUsers>()),
                        ),
                      ),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 15),
                            child: BlocProxy<CubitToDo>(
                              child: _BodyToDOContent(id: id!),
                              bloc: (context, bloc) => CubitToDo(di.sl<UCToDo>()),
                            ),
                          )),
                    ],
                  ),
      );
  }
}

class _HeadToDOContent extends StatefulWidget{

  String img;
  IconData icon;
  Color color;

  int id;

  _HeadToDOContent({required this.id, required this.color, required this.icon, required this.img});

  @override
  State<_HeadToDOContent> createState() => _HeadToDOContentState();
}

class _HeadToDOContentState extends State<_HeadToDOContent> {



  @override
  void initState() {
    call(widget.id);
    super.initState();
  }

  void call(int id){
    context.read<CubitUsers>().loadUserById(id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitUsers, CubitUsersState>(
        builder: (context, snapshot) {
          if (snapshot is CubitUsersStateLoading) {
            return Center(child: CircularP());
          }
          else if (snapshot is CubitUsersStateLoaded<User>) {
            final profile = snapshot.data;
            return HeadProfile(profile: profile, icon: widget.icon, color: widget.color, img: widget.img,);

          } else if (snapshot is CubitUsersStateError) {
            return ErrorBox(
                text: snapshot.messgae,
                call: () => call(widget.id)
            );
          }
          return SizedBox.shrink();
        });
  }
}

class _BodyToDOContent extends StatefulWidget{

  int id;

  _BodyToDOContent({required this.id});

  @override
  State<_BodyToDOContent> createState() => _BodyToDOContentState();
}

class _BodyToDOContentState extends State<_BodyToDOContent> {
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