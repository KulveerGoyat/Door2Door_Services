//Use this inside main Theme to call Light or dark Modes
import 'package:flutter/material.dart';
import '../Constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder( borderRadius: BorderRadius.circular(100)),
    prefixIconColor: secondaryColor,
    floatingLabelStyle: const TextStyle(color: secondaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: secondaryColor),),);

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: primaryColor,
    floatingLabelStyle: const TextStyle(color: primaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: primaryColor),),);
}