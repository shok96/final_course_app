
/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 04.02.2022, 12:37
 */

import 'BaseException.dart';

class ImplException extends BaseException{

  ImplException({required this.model});

  @override
  String toString() {
    return "code = ${this.code}, message = Implementation not found into ${this.model}";
  }

  @override
  int code = -100;

  String model;

}