/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 21:26
 */

import 'package:final_course_app/data/models/users/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UsersTileHead extends StatelessWidget {
  User data;
  String img;
  Color color;

  UsersTileHead({Key? key, required this.data, required this.img, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${data.name ?? ""}", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20.sp),),
              CircleAvatar(
                radius: 45.r,
                child: Image.asset(img),
              ),
            ],
          ),

          SizedBox(height: 10.h,),
          _PanelItem(color: color, icon: Icons.phone, text: "${data.phone}"),
          SizedBox(height: 10.h,),
          _PanelItem(color: color, icon: Icons.work, text: "${data.company?.name}"),
          SizedBox(height: 10.h,),
          _PanelItem(color: color, icon: Icons.location_history, text: "${data.address?.city} ${data.address?.street} ${data.address?.suite}"),
          SizedBox(height: 10.h,),
          _PanelItem(color: color, icon: Icons.email, text: "${data.email}"),
          SizedBox(height: 50.h,)
        ],
      ),
    );
  }
}

class _PanelItem extends StatelessWidget{

  Color color;
  IconData icon;
  String text;

  _PanelItem({required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0.r),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color,),
            SizedBox(width: 5.w,),
            Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: color),),
          ],
        ),
      ),
    );
  }

}
