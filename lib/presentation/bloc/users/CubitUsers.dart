/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 22:16
 */

import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/domains/usecases/intf/UCSplash.dart';
import 'package:final_course_app/domains/usecases/intf/UCUsers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/CubitUsersState.dart';



class CubitUsers extends Cubit<CubitUsersState>{

 final UCUsers _ucUsers;

  CubitUsers(this._ucUsers) : super(CubitUsersStateEmpty());

  void loadUsers() async{

    await Future.delayed(Duration(milliseconds: 100));

    if(state is CubitUsersStateLoading) return;

    emit(CubitUsersStateLoading());

   final data = await _ucUsers.getUsers();

    if(data.isSuccessfull)
      if (data.body!.length > 0)
        emit(CubitUsersStateLoaded<List<User>>(data.body!));
      else
        emit(CubitUsersStateEmptyList());
    else
      emit(CubitUsersStateError(messgae: data.error ?? "error"));
  }

 void loadUserById(int id) async{

   await Future.delayed(Duration(milliseconds: 100));

   if(state is CubitUsersStateLoading) return;

   emit(CubitUsersStateLoading());

   final data = await _ucUsers.getUserById(id);

   if(data.isSuccessfull)
       emit(CubitUsersStateLoaded<User>(data.body!));
   else
     emit(CubitUsersStateError(messgae: data.error ?? "error"));
 }


}