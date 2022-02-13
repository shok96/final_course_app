/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 21:24
 */

import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/presentation/widgets/users_card_head.dart';
import 'package:flutter/material.dart';

class HeadProfile extends StatelessWidget {

  User profile;
  String img;
  Color color;
  IconData icon;

  HeadProfile({Key? key, required this.profile, required this.color, required this.icon, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UsersCardHead(data: profile, img: img, color: color, icon: icon);

  }
}
