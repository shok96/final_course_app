/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 12.01.2022, 22:40
 */

abstract class BaseException implements Exception{

  int code = -1;
  String message = "Base Failure";

}