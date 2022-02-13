/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:03
 */

import 'package:final_course_app/core/consts/ImagesConsts.dart';
import "package:final_course_app/core/controller/pageRoutes.dart";
import 'package:final_course_app/presentation/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(30.r)),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(context),
            createDrawerBodyItem(
              icon: Icons.home,
              text: 'Пользователи',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, pageRoutes.users),
            ),
            createDrawerBodyItem(
              icon: Icons.account_circle,
              text: 'Список дел',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, pageRoutes.todo),
            ),
          ],
        ),
      ),
    );
  }

  Widget createDrawerBodyItem(
      {IconData? icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blueAccent,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Profile(
                  img: ImagesConsts.personList.first,
                  color: ImagesConsts.colorCardList.first,
                  icon: ImagesConsts.iconCardList.first,
                  id: 1,
                )));
      },
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(ImagesConsts.personList.first))),
        child: SizedBox.shrink(),
      ),
    );
  }
}
