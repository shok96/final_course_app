/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 29.01.2022, 20:45
 */

import 'package:flutter/material.dart';

class Panel extends StatelessWidget {

  Panel({Key? key, required this.child, this.hint = "", this.marginTop = false, this.errorText = "", this.error = false}) : super(key: key);

  String hint;
  String errorText;
  bool error;
  Widget child;
  bool marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginTop ? EdgeInsets.only(top: 21) : EdgeInsets.all(0),
      child: InputDecorator(
        decoration: InputDecoration(
          errorText: error ? errorText : null,
          labelText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: child,
      ),
    );
  }
}
