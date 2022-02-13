/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 22:14
 */

import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/domains/usecases/UseCaseGlobal.dart';

abstract class UCUsers extends UseCaseGlobal<void, void>{
  Future<MTaskResult<List<User>>> getUsers();
  Future<MTaskResult<User>> getUserById(int id);
}