/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:34
 */

import 'package:final_course_app/core/controller/pageRoutes.dart';
import 'package:final_course_app/domains/usecases/intf/UCSplash.dart';
import 'package:final_course_app/presentation/bloc/splash/CubitSplash.dart';
import 'package:final_course_app/presentation/bloc/splash/state/CubitSplahState.dart';
import 'package:final_course_app/presentation/widgets/bloc_proxy.dart';
import 'package:final_course_app/presentation/widgets/circular_p.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_course_app/core/di.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  static const String routeName = '/splash';

  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: BlocProxy<CubitSplash>(
          bloc: (context, bloc) => CubitSplash(di.sl<UCSplash>()),
          child: _Splash()),
    );
  }
}

class _Splash extends StatefulWidget {
  @override
  State<_Splash> createState() => _SplashState();
}

class _SplashState extends State<_Splash> {

  @override
  void initState() {
    context.read<CubitSplash>().loadSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitSplash, CubitSplashState>(
        listener: (context, snapshot) {
          if (snapshot is CubitSplashStateLoaded) {
           Navigator.of(context).pushNamed(pageRoutes.users);
          }
        },
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterLogo(size: 60.sp),
                SizedBox(height: 30.h,),
                CircularP(),
              ],
            ),
          );
        });
  }
}
