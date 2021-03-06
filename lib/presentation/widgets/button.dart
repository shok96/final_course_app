
/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 20:28
 */

import 'package:final_course_app/core/extensions/app_utils.dart';

import 'package:flutter/material.dart';


class Button extends StatelessWidget {

  Function()? action;

  String text;

  bool enabled;

  String enabledText;

  bool error;

  Button({Key? key, this.text = "", this.action, this.enabled = true, this.enabledText = "", this.error = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? action : () => showInSnackBar(context, enabledText),
      child: Container(
        margin: EdgeInsets.only(top: 21),
        width: double.infinity,
        decoration: BoxDecoration(
          color: enabled ? HexColor.fromHex("#5DB075") : Colors.grey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Center(child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
              error ? Icon(Icons.error) : Container()
            ],
          )),
        ),
      ),
    );
  }
}
