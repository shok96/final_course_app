

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 20:31
 */

import 'package:final_course_app/core/exception/ImplException.dart';
import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';

abstract class UseCaseGlobal<Type, Params>{

  Type call(Params param){
    throw ImplException(model: param.toString());
  }

  Future<Type> FutureCall(Params param){
    throw ImplException(model: param.toString());
  }

  Future<MTaskResult<Type>> NetCall(Params param){
    throw ImplException(model: param.toString());
  }

}