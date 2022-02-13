/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 22:58
 */

import 'package:final_course_app/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:final_course_app/data/models/ToDo.dart';
import 'package:final_course_app/data/models/users/User.dart';
import 'package:final_course_app/domains/repository/repository.dart';
import 'package:final_course_app/domains/usecases/intf/UCToDo.dart';


class UCToDoImpl extends UCToDo {

  Repository _repository;

  UCToDoImpl(this._repository);

  @override
  Future<MTaskResult<List<ToDo>>> NetCall(int param) {
    return _repository.getToDo(param);
  }

}
