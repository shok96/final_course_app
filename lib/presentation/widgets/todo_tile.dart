/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 21:51
 */

import 'package:final_course_app/core/themes/constantsTheme.dart';
import 'package:final_course_app/data/models/ToDo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoTile extends StatefulWidget {
  ToDo data;

  TodoTile({Key? key, required this.data}) : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState(data: data);
}

class _TodoTileState extends State<TodoTile> {
  ToDo data;

  TextStyle? textStyle(BuildContext context){
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(color: Colors.black);
  }
  
  
  _TodoTileState({required this.data}) {
    isChecked = data.completed ?? false;
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: grey),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Text("${data.title ?? ""}",
                        style: textStyle(context)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Column(
                      children: [
                        isChecked
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                        isChecked
                            ? Text("Waiting",
                                style: textStyle(context))
                            : Text("Done",
                                style: textStyle(context))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        // ListTile(
        //   tileColor: Color(data.hashCode).withOpacity(0.3),
        //   subtitle: Divider(),
        //   title: Text("${data.title ?? ""}"),
        //   trailing: Checkbox(
        //     value: isChecked,
        //     onChanged: (value){
        //       setState(() {
        //         isChecked = value ?? false;
        //       });
        //     },
        //   ),
        // ),
        );
  }
}
