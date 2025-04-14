import 'dart:developer';

import 'package:Door2Door_Services/Src/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/size.dart';
import '../../../Constants/text_strings.dart';
import '../../../Database/firebase_services.dart';

class OTPScreen extends StatefulWidget {
  final String verificationID;
  final auth = AuthService();

  OTPScreen({super.key, required this.verificationID});

  @override
  OTPScreenState createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {
  final _otp = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  otpTitle,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 80.0),
                ),
                Text(
                  otpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 40.0),
                const Text("$otpMessage support@Kulveergoyat1.com",
                    textAlign: TextAlign.center),
                const SizedBox(height: 20.0),
                Pinput(
                  controller: _otp,
                  length: 6,
                  onCompleted: (code) {
                    log("OTP is => $code");
                  },
                  onChanged: (value) {
                    log("OTP entered: $value");
                  },
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDarkMode
                            ? primaryColor
                            : Colors.black.withValues(alpha: 0.5),
                      ),
                      color: isDarkMode
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                _isLoading
                    ? CircularProgressIndicator(color: Colors.blueAccent,)
                    : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_otp.text.length != 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a valid OTP')),
                        );
                        return;
                      }
                      setState(() {
                        _isLoading = true;
                      });

                      try {
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationID,
                            smsCode: _otp.text);

                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          _isLoading = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message ?? 'OTP verification failed'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Verify OTP",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
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
