import 'package:dio/dio.dart' hide Headers;
import 'package:final_course_app/network/net.dart';
import 'package:final_course_app/network/responseModel/MTaskResult.dart';


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