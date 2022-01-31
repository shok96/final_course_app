import 'dart:convert';


import 'package:dio/dio.dart' hide Headers;
import 'package:final_course_app/models/ToDo.dart';
import 'package:final_course_app/models/users/User.dart';


import 'package:retrofit/dio.dart';
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