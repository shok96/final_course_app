/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:15
 */

import 'package:final_course_app/domains/usecases/intf/UCSplash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/CubitSplahState.dart';


class CubitSplash extends Cubit<CubitSplashState>{

 final UCSplash ucSplash;

  CubitSplash(this.ucSplash) : super(CubitSplashStateEmpty());

  void loadSplash() async{

    await Future.delayed(Duration(milliseconds: 100));

    if(state is CubitSplashStateLoading) return;

    emit(CubitSplashStateLoading());

    await Future.delayed(Duration(seconds: 2));

    emit(CubitSplashStateLoaded(null));

  }


}