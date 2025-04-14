import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/size.dart';
import '../../../Constants/text_strings.dart';
import '../../../Widgets/forget_password_btn_widget.dart';
import 'forgot_password_email_screen.dart';
import 'forgot_password_phone_screen.dart';

Future<dynamic> buildShowModalBottomSheet(BuildContext context, double width) async {
  var mediaQuery = MediaQuery.of(context);
  var brightness = mediaQuery.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;

  return showModalBottomSheet(
    context: context,
    backgroundColor: isDarkMode ? secondaryColor : primaryColor,
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0),),
    builder: (context) => Container(
      padding: EdgeInsets.all(defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            forgetPasswordTitle,
            style:
            Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            forgetPasswordSubTitle,
            style:
            Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 30.0,
          ),
          ForgetPasswordBTNWidget(
              btnIcon : Icons.mail_outline_rounded,
              title: email,
              onTap: ()  async {
                await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgotPasswordEmailScreen()));},
              subTitle: resetViaEMail,
              width: width),
          SizedBox(height: 20.0,),
          ForgetPasswordBTNWidget(
              btnIcon : Icons.mobile_friendly_rounded,
              title: phoneNo,
              onTap: () async {
                await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgotPasswordPhoneScreen()));
              },
              subTitle: resetViaPhone,
              width: width),
        ],
      ),
    ),
  );
}