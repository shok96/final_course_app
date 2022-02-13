/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 22:53
 */

import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/domains/usecases/intf/UCToDo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/CubitToDoState.dart';

class CubitToDo extends Cubit<CubitToDoState>{

 final UCToDo _ucToDo;

  CubitToDo(this._ucToDo) : super(CubitToDoStateEmpty());

  void loadToDo(int id) async{

    await Future.delayed(Duration(milliseconds: 100));

    if(state is CubitToDoStateLoading) return;

    emit(CubitToDoStateLoading());

   final data = await _ucToDo.NetCall(id);

    if(data.isSuccessfull)
      if (data.body!.length > 0)
        emit(CubitToDoStateLoaded<List<ToDo>>(data.body!));
      else
        emit(CubitToDoStateEmptyList());
    else
      emit(CubitToDoStateError(messgae: data.error ?? "error"));
  }



}