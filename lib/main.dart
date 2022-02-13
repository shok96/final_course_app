/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 21:09
 */

import 'package:flutter_screenutil/flutter_screenutil.dart';

import "core/controller/pageRoutes.dart";
import 'package:final_course_app/presentation/views/profile.dart';
import 'package:final_course_app/presentation/views/splash.dart';
import 'package:final_course_app/presentation/views/to_do_list.dart';
import 'package:final_course_app/presentation/views/user_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/di.dart' as di;
import 'core/themes/base_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: () {
          return MaterialApp(
            title: 'Flutter Pizza',
            theme: themeData(context),
            debugShowCheckedModeBanner: false,
            initialRoute: pageRoutes.splash,
            routes: {
              pageRoutes.splash: (context) => Splash(),
              pageRoutes.users: (context) => UserList(),
              pageRoutes.todo: (context) => ToDoList(),
            },
          );
        });
  }
}
