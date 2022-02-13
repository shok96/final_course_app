/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.02.2022, 20:22
 */

import 'BaseException.dart';

class CacheException extends BaseException{

  CacheException({required this.model});

  @override
  String toString() {
    return "code = ${this.code}, message = Cache error - ${this.model}";
  }

  @override
  int code = -10;

  String model;

}