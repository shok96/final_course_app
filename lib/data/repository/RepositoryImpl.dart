/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:26
 */

import 'package:final_course_app/core/exception/CacheException.dart';
import 'package:final_course_app/core/exception/RemoteException.dart';
import 'package:final_course_app/data/datasource/network/RemoteDataSource.dart';
import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/domains/repository/repository.dart';

enum mode {
  Users,
  UserById,
  ToDoById,
}

class RepositoryImpl implements Repository {
  RemoteDataSource remoteDataSource;
 // CacheDataSource cacheDataSource;

  // RepositoryImpl(
  //     {required this.remoteDataSource, required this.cacheDataSource});

  RepositoryImpl(
      {required this.remoteDataSource});

  @override
  Future<MTaskResult<List<User>>> getUsers() {
    return _getRepository<List<User>>(mode.Users);
  }

  @override
  Future<MTaskResult<User>> getUserById(int id) {
    return _getRepository<User>(mode.UserById, id: id);
  }

  @override
  Future<MTaskResult<List<ToDo>>> getToDo(int id) {
    return _getRepository<List<ToDo>>(mode.ToDoById, id: id);
  }


  Future<MTaskResult<T>> _getRepository<T>(mode values, {int id = 0}) {
    try {
      return _getCache(values, id: id);
    } catch (_) {
      return _getRemote(values, id: id);
    }
  }

  _getRemote(mode values, {required int id}) {
    switch (values) {
      case mode.Users:
        {
          return remoteDataSource.getUsers();
        }
      case mode.UserById:
        {
          return remoteDataSource.getUserById(id);
        }
      case mode.ToDoById:
        {
          return remoteDataSource.getToDo(id);
        }
      default:
        {
          throw RemoteException(model: values.name);
        }
    }
  }

  _getCache(mode values, {required int id}) {
    switch (values) {
      default:
        {
          throw CacheException(model: values.name);
        }
    }
  }





}
