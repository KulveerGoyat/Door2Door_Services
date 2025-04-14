import 'package:Door2Door_Services/Constants/size.dart';
import 'package:Door2Door_Services/Constants/text_strings.dart';
import 'package:Door2Door_Services/Database/firebase_services.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../Constants/colors.dart';
import 'email_verification_controller.dart';

class EmailVerification extends StatelessWidget {
  final auth = AuthService();
  final String email;
  final emailController = EmailVerificationController();
  EmailVerification({super.key , required this.email});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultSize * 4, // Top & Bottom padding
            horizontal: defaultSize * 2, // Left & Right padding
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content
            children: [
              // Envelope Icon at the top
              const Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
                color: Colors.blueAccent, // Set a color for the icon
              ),
              const SizedBox(height: defaultSize * 2),

              // Title Text
              Text(
                verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultSize),

              // Subtitle Text
              Text(
                verifyEmailSubTitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultSize * 2),

              // Continue Button
              SizedBox(
                width: double.infinity, // Button takes full width
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: () {
                    auth.checkEmailVerificationStatus(context);
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: defaultSize * 2),

              // Resend Email Button
              TextButton(
                onPressed: () {
                 emailController.resendVerificationEmail(email, context);
                },
                child: Text(
                  resendEmail,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Back to Login Button
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      toLogin,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
