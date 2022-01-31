import 'package:final_course_app/controller/NetController.dart';
import 'package:final_course_app/controller/pageRoutes.dart';
import 'package:final_course_app/themes/base_theme.dart';
import 'package:final_course_app/view/Reg.dart';

import 'package:final_course_app/view/profile.dart';
import 'package:final_course_app/view/splash.dart';
import 'package:final_course_app/view/to_do_list.dart';
import 'package:final_course_app/view/user_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

NetController net = NetController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pizza',
      theme: themeData(context),
      debugShowCheckedModeBanner: false,
      initialRoute: pageRoutes.splash,
      routes: {
        pageRoutes.splash: (context) => Splash(),
        pageRoutes.reg: (context) => Reg(),
        pageRoutes.users: (context) => UserList(),
        pageRoutes.todo: (context) => ToDoList(),
        pageRoutes.profile: (context) => Profile(),
      },
    );
  }
}

