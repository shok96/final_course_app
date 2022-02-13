/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:26
 */

import 'package:final_course_app/core/controller/NetController.dart';
import 'package:final_course_app/data/datasource/network/RemoteDataSource.dart';
import 'package:final_course_app/data/datasource/network/net.dart';
import 'package:final_course_app/data/repository/RepositoryImpl.dart';
import 'package:final_course_app/domains/repository/repository.dart';
import 'package:final_course_app/domains/usecases/impl/UCSplashImpl.dart';
import 'package:final_course_app/domains/usecases/impl/UCToDoImpl.dart';
import 'package:final_course_app/domains/usecases/impl/UCUsersImpl.dart';
import 'package:final_course_app/domains/usecases/intf/UCSplash.dart';
import 'package:final_course_app/domains/usecases/intf/UCToDo.dart';
import 'package:final_course_app/domains/usecases/intf/UCUsers.dart';
import 'package:final_course_app/presentation/bloc/splash/CubitSplash.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => CubitSplash(sl()));

  sl.registerLazySingleton<UCSplash>(() => UCSplashImpl());
  sl.registerLazySingleton<UCUsers>(() => UCUsersImpl(sl()));
  sl.registerLazySingleton<UCToDo>(() => UCToDoImpl(sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  // sl.registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl(sl()));
  //
  sl.registerLazySingleton(() => Api(sl()));

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => NetController());
  // sl.registerLazySingleton(() => DBController(sl()));
  //
  // final database = AppDatabase();
  // sl.registerLazySingleton(() => database);
}