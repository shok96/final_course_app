
import 'package:final_course_app/extensions/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Input extends StatelessWidget {
  final Icon? icon;
  final String? hint;
  final TextEditingController? controller;
  final bool? obscure;
  final TextInputType? type;
  final List<TextInputFormatter>? formater;
  Function(String)? onchange;
  bool marginTop;

  Input({this.controller, this.icon, this.hint, this.obscure, this.type, this.formater, this.onchange, this.marginTop = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginTop ? EdgeInsets.only(top: 21) : EdgeInsets.all(0),
      child: TextField(
        onChanged: onchange,
        inputFormatters: formater ?? [],
        keyboardType: type ?? TextInputType.text,
        controller: controller,
        obscureText: obscure ?? false,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: HexColor.fromHex("#5DB075")),
        decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: HexColor.fromHex("#F6F6F6"),
            contentPadding: EdgeInsets.only(left: 16.0, bottom: 16, top: 16),
            hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: HexColor.fromHex("#BDBDBD")),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: HexColor.fromHex("#F2F3F7"), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: HexColor.fromHex("#F2F3F7"), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: icon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.grey),
                      child: icon!,
                    ),
                  )
                : null),
      ),
    );
  }
}
