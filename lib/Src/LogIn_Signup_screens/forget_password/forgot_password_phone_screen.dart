import 'package:Door2Door_Services/Constants/image_strings.dart';
import 'package:Door2Door_Services/Constants/size.dart';
import 'package:Door2Door_Services/Constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Database/firebase_services.dart';
import '../../../Widgets/form_header_widget.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  ForgotPasswordPhoneScreen({super.key});

  final _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
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
                SizedBox(height: defaultSize * 4),
                FormHeaderWidget(
                  image: forgotImg,
                  title: forgetPassword,
                  subTitle: forgetPasswordSubTitle,
                  imageHeight: 0.25,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 15.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: formSize),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _phone,
                        decoration: InputDecoration(
                          label: Text(phoneNo),
                          hintText: phoneNo,
                          prefixIcon: Icon(Icons.mobile_friendly_rounded),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value.length < 10) {
                            return 'Phone number must be at least 10 digits';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_phone.text.isEmpty || _phone.text.length < 10) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please enter a valid phone number')),
                              );
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sending OTP...')),
                            );

                            try {
                              await auth.phoneVerification(_phone.text.trim(), context);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to send OTP: $e')),
                              );
                            }
                          },
                          child: Text(
                            next,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
