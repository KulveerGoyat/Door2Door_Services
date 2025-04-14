import 'package:Door2Door_Services/utils/elevated_button_theme.dart';
import 'package:Door2Door_Services/utils/outlined_button_theme.dart';
import 'package:Door2Door_Services/utils/text_formfield_theme.dart';
import 'package:Door2Door_Services/utils/text_theme.dart';
import 'package:flutter/material.dart';
import '../Constants/colors.dart';

class TMyTheme {
  TMyTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme:TElevatedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme
  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
   textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    iconTheme: const IconThemeData(
      color: secondaryColor,),
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme: TElevatedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme
  );
}