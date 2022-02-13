

/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 21:14
 */

abstract class CubitUsersState {}

class CubitUsersStateEmpty extends CubitUsersState {}

class CubitUsersStateEmptyList extends CubitUsersState {}

class CubitUsersStateLoading extends CubitUsersState {}

class CubitUsersStateComplete extends CubitUsersState {}

class CubitUsersStateLoaded<T> extends CubitUsersState {
  final T data;

  CubitUsersStateLoaded(this.data);
}

class CubitUsersStateError extends CubitUsersState {
  final String messgae;

  CubitUsersStateError({required this.messgae});
}
