/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 22:14
 */

import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/domains/repository/repository.dart';
import 'package:final_course_app/domains/usecases/intf/UCUsers.dart';

class UCUsersImpl extends UCUsers {

  Repository _repository;

  UCUsersImpl(this._repository);

  @override
  Future<MTaskResult<List<User>>> getUsers() {
    return _repository.getUsers();
  }

  @override
  Future<MTaskResult<User>> getUserById(int id) {
    return _repository.getUserById(id);
  }
}
