

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 20:38
 */

abstract class CubitSplashState {}

class CubitSplashStateEmpty extends CubitSplashState {}

class CubitSplashStateEmptyList extends CubitSplashState {}

class CubitSplashStateLoading extends CubitSplashState {}

class CubitSplashStateComplete extends CubitSplashState {}

class CubitSplashStateLoaded<T> extends CubitSplashState {
  final T data;

  CubitSplashStateLoaded(this.data);
}

class CubitSplashStateError extends CubitSplashState {
  final String messgae;

  CubitSplashStateError({required this.messgae});
}
