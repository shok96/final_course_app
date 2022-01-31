import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constantsTheme.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.lightBlue,
      unselectedWidgetColor: Colors.red,
      toggleableActiveColor: Colors.yellow,
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
      scrimColor: Colors.white,
      elevation: 0
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.lightBlue,
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

