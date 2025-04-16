
import 'dart:async';
import 'package:Door2Door_Services/Src/Startup_screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 100),
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/logo2.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
             Text(
              'Door2Door Services',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 32,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
           CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(isDarkMode? Colors.blue : secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}