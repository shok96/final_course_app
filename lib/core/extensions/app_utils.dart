/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 13.02.2022, 18:08
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showInSnackBar(BuildContext context, String value) {
  final snackBar = SnackBar(content: Text(value));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Color getRandomColor(List<Color> data){
  final copy = [...data];
  copy.shuffle();
  return copy.first;
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
          '${alpha.toRadixString(16).padLeft(2, '0')}'
          '${red.toRadixString(16).padLeft(2, '0')}'
          '${green.toRadixString(16).padLeft(2, '0')}'
          '${blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase();

  String toRGB() => '${red}, ${green}, ${blue}';

}