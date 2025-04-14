import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../Constants/colors.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      appBar: AppBar(
        title: Text("About Us", style: Theme.of(context).textTheme.headlineMedium),
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left_solid),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Logo or App Header Image
              ClipOval(
                child: Image.asset(
                  "assets/logo/logo2.png",
                  height: height * 0.2,
                  width: width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * 0.02),

              // About Text
              Material(
                color: isDarkMode ? secondaryColor : containerBg,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDarkMode ? secondaryColor : containerBg,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: isDarkMode ? primaryColor : secondaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    'Welcome to Door2Door Services!\n\nOur app allows you to easily book professional services to your doorstep. Whether you need pet care, home repairs, or any other service, we connect you with verified professionals to make your life easier and more convenient.\n\nWe are committed to providing the best service, with reliability and professionalism at the forefront.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // Features Section
              Material(
                color: isDarkMode ? secondaryColor : containerBg,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDarkMode ? secondaryColor : containerBg,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: isDarkMode ? primaryColor : secondaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.check_square, color: isDarkMode ? primaryColor : secondaryColor),
                          SizedBox(width: width * 0.02),
                          Text(
                            'Easy booking process',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.check_square, color: isDarkMode ? primaryColor : secondaryColor),
                          SizedBox(width: width * 0.02),
                          Text(
                            'Verified professionals',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          Icon(LineAwesomeIcons.check_square, color: isDarkMode ? primaryColor : secondaryColor),
                          SizedBox(width: width * 0.02),
                          Text(
                            '24/7 support and reliability',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // Contact Information Section
              Material(
                color: isDarkMode ? secondaryColor : containerBg,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDarkMode ? secondaryColor : containerBg,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: isDarkMode ? primaryColor : secondaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'For support or any questions, you can reach us at:',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Email: Kulveergoyat1@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Phone: +91 7988088819',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
