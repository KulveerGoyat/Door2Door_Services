import 'package:Door2Door_Services/Animations/animation_design.dart';
import 'package:Door2Door_Services/Constants/colors.dart';
import 'package:Door2Door_Services/Constants/image_strings.dart';
import 'package:Door2Door_Services/Constants/size.dart';
import 'package:Door2Door_Services/Model/fade_in_animation_model.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/login.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Animations/animation_controller.dart';
import '../../Constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                topAfter: 0,
                topBefore: 0,
                leftAfter: 0,
                leftBefore: 0,
                rightAfter: 0,
                rightBefore: 0),
            child: Container(
              padding: const EdgeInsets.all(defaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(welcomeImg),
                    height: height * 0.6,
                  ),
                  Column(
                    children: [
                      Text(
                        welcomeTitle,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32,
                                  letterSpacing: 0.5,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        welcomeSubTitle,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: 20,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: const Text(
                                login,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const SignupPage()),
                                );
                              },
                              child: const Text(
                                signUp,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
