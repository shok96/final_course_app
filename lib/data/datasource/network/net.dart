

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:26
 */

import 'package:dio/dio.dart' hide Headers;
import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/data/models/users/User.dart';
import 'package:retrofit/retrofit.dart';
part 'net.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class Api{

  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET("users/{id}")
  Future<User> getUser(@Path() int id);

  @GET("users")
  Future<List<User>> getUsers();

  @GET("todos")
  Future<List<ToDo>> getToDo(@Query("userId") int id);


}