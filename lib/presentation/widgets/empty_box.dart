

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 21:35
 */

import 'package:final_course_app/core/themes/constantsTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button.dart';

class EmptyBox extends StatelessWidget {

  String text;

  EmptyBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 150.h,
          maxWidth: 300.w
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.delete, color: yellow, size: 32.sp,),
              Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
