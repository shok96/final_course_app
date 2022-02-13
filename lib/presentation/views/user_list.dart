/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:10
 */

import 'package:final_course_app/core/consts/ImagesConsts.dart';
import 'package:final_course_app/core/extensions/app_utils.dart';
import 'package:final_course_app/data/models/users/User.dart';
import "package:final_course_app/core/controller/pageRoutes.dart";
import 'package:final_course_app/domains/usecases/intf/UCUsers.dart';
import 'package:final_course_app/presentation/bloc/users/CubitUsers.dart';
import 'package:final_course_app/presentation/bloc/users/state/CubitUsersState.dart';
import 'package:final_course_app/presentation/widgets/bloc_proxy.dart';
import 'package:final_course_app/presentation/widgets/circular_p.dart';
import 'package:final_course_app/presentation/widgets/empty_box.dart';
import 'package:final_course_app/presentation/widgets/error_box.dart';
import 'package:final_course_app/presentation/widgets/navigation_drawer.dart';
import 'package:final_course_app/presentation/widgets/users_card_item.dart';
import 'package:final_course_app/presentation/widgets/users_tile.dart';
import 'package:flutter/material.dart';
import 'package:final_course_app/core/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserList extends StatelessWidget {
  static const String routeName = '/users';

  UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пользователи"),
      ),
      drawer: navigationDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: BlocProxy<CubitUsers>(
                      child: _UsersListContent(),
                      bloc: (context, bloc) => CubitUsers(di.sl<UCUsers>()),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class _UsersListContent extends StatefulWidget {
  @override
  State<_UsersListContent> createState() => _UsersListContentState();
}

class _UsersListContentState extends State<_UsersListContent> {
  List<String> pL = ImagesConsts.personList;

  @override
  void initState() {
    call();
    super.initState();
  }

  void call() {
    context.read<CubitUsers>().loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitUsers, CubitUsersState>(
        builder: (context, snapshot) {
      if (snapshot is CubitUsersStateLoading) {
        return Center(child: CircularP());
      } else if (snapshot is CubitUsersStateEmptyList) {
        return EmptyBox(text: "К сожалению раздел пуст((");
      } else if (snapshot is CubitUsersStateLoaded<List<User>>) {
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final data = snapshot.data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.r),
                child: UsersCardItem(
                  data: data,
                  img: pL[index],
                  color: ImagesConsts.colorCardList[index],
                  icon: ImagesConsts.iconCardList[index],
                ),
              );
            });
      } else if (snapshot is CubitUsersStateError) {
        return ErrorBox(text: snapshot.messgae, call: () => call());
      }
      return SizedBox.shrink();
    });
  }
}
