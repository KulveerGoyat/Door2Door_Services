import 'package:Door2Door_Services/Constants/image_strings.dart';
import 'package:Door2Door_Services/Constants/size.dart';
import 'package:Door2Door_Services/Constants/text_strings.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/forget_password/email_verification_controller.dart';
import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/form_header_widget.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  ForgotPasswordEmailScreen({super.key});

  final _email = TextEditingController();
  final emailController = EmailVerificationController();

  @override
  build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: defaultSize * 4,
                ),
                FormHeaderWidget(
                  image: forgotImg,
                  title: forgetPassword,
                  subTitle: forgetPasswordSubTitle,
                  imageHeight: 0.25,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 15.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: formSize,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        label: Text(email),
                        hintText: email,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          emailController.sendVerification(
                              _email.text.trim().toLowerCase(), context);
                        },
                        child: Text(
                          next,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
