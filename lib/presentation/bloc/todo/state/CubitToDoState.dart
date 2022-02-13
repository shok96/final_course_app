

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 22:20
 */

abstract class CubitToDoState {}

class CubitToDoStateEmpty extends CubitToDoState {}

class CubitToDoStateEmptyList extends CubitToDoState {}

class CubitToDoStateLoading extends CubitToDoState {}

class CubitToDoStateComplete extends CubitToDoState {}

class CubitToDoStateLoaded<T> extends CubitToDoState {
  final T data;

  CubitToDoStateLoaded(this.data);
}

class CubitToDoStateError extends CubitToDoState {
  final String messgae;

  CubitToDoStateError({required this.messgae});
}
