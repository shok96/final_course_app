/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 22:12
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constantsTheme.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.blueAccent,
    scaffoldBackgroundColor: lightGrey,
      unselectedWidgetColor: Colors.red,
      toggleableActiveColor: Colors.yellow,
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
      elevation: 0
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: lightGrey,
        foregroundColor: violetDark,
        elevation: 0),
    colorScheme: ColorScheme.dark(
      secondary: Colors.green,
      surface: Colors.white,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: Colors.blueAccent,

    textTheme: GoogleFonts.robotoTextTheme().copyWith(bodyText2: TextStyle(color: Colors.white))
  );
}

