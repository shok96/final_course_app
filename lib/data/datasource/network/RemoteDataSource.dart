/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:26
 */

import 'package:final_course_app/core/controller/NetController.dart';
import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/data/models/users/User.dart';

import 'responseModel/MTaskResult.dart';


abstract class RemoteDataSource{

  Future<MTaskResult<List<User>>> getUsers();
  Future<MTaskResult<User>> getUserById(int id);
  Future<MTaskResult<List<ToDo>>> getToDo(int id);

}

class RemoteDataSourceImpl implements RemoteDataSource{

  NetController _net;

  RemoteDataSourceImpl(this._net);

  @override
  Future<MTaskResult<List<User>>> getUsers() async{
    return _net.asyncResult(_net.api.getUsers());
  }

  @override
  Future<MTaskResult<User>> getUserById(int id) {
    return _net.asyncResult(_net.api.getUser(id));
  }

  @override
  Future<MTaskResult<List<ToDo>>> getToDo(int id) {
    return _net.asyncResult(_net.api.getToDo(id));
  }



}