
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/size.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightOutlinedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: Colors.white,
      backgroundColor: secondaryColor,
      side:  const BorderSide(color: secondaryColor),
      padding:  const EdgeInsets.symmetric(vertical: buttonHeight),

    ),
  );

  static final darkOutlinedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: secondaryColor,
      backgroundColor: Colors.white,
      side:  const BorderSide(color: Colors.white),
      padding:  const EdgeInsets.symmetric(vertical: buttonHeight),

    ),
  );

}