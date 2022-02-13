/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 21:16
 */

import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/presentation/widgets/users_tile_head.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersCardHead extends StatelessWidget {

  User data;
  String img;
  Color color;
  IconData icon;

  UsersCardHead({Key? key, required this.data, required this.img, required this.color, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: Stack(
          children: [
            Positioned(
                left: -10.w,
                bottom: -10.h,

                child: _RoundIcon(color: color, icon: icon,)),
            Align(
                alignment: Alignment.centerRight,
                child: UsersTileHead(data: data, img: img, color: color,)),
          ],
        ),
      ),
    );
  }
}


class _RoundIcon extends StatelessWidget{

  Color color;
  IconData icon;

  _RoundIcon({required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 10.r)
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(3.0.r),
          child: Icon(icon, size: 30.sp,),
        ),
      ),
    );
  }



}