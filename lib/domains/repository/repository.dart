

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:26
 */

import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/data/models/users/User.dart';

abstract class Repository{
  Future<MTaskResult<List<User>>> getUsers();
  Future<MTaskResult<User>> getUserById(int id);
  Future<MTaskResult<List<ToDo>>> getToDo(int id);

}