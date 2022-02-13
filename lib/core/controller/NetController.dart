/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 20:22
 */

import 'package:dio/dio.dart' hide Headers;
import 'package:final_course_app/data/datasource/network/net.dart';
import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';


class NetController{

 late Api _api;

 Api get api => _api;

  final _dio = Dio();

  NetController(){
    initRetrofit();
  }


  void initRetrofit(){
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
    _dio.options.headers["Content-Type"] = 'application/json';
    _api = Api(_dio);
  }

  Future<MTaskResult<T>> asyncResult<T>(Future<T?>? obj) async{
    try {
      var res = await obj;
      return MTaskResult(data: "", isSuccessfull: true, body: res);
    }
    catch (e) {
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          return MTaskResult(isSuccessfull: false, error: e.error.toString());
        default:
      }
    }
    return MTaskResult(data: "", isSuccessfull: true);
  }


}