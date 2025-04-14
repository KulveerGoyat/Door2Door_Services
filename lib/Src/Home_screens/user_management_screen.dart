import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../Constants/colors.dart';  // Ensure your color constants are imported correctly

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
        title: Text("Privacy Policy", style: Theme.of(context).textTheme.headlineMedium),
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left_solid),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 10,right: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/logo/logo.png',
                  height: height * 0.2,
                  width: width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * 0.02),

              // Privacy Policy Text
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
                    'At Door2Door Services, we are committed to protecting your privacy. This privacy policy outlines how we collect, use, and protect your information when using our app.\n\n'
                        '1. **Information We Collect:**\n\n'
                        'We collect personal information such as your name, email address, phone number, and booking details when you use our app to make bookings or contact us.\n\n'
                        '2. **Use of Information:**\n\n'
                        'The information we collect is used to improve your experience, manage your bookings, and provide customer support. We may also use it to send you updates, promotional offers, or other important notifications.\n\n'
                        '3. **Data Protection:**\n\n'
                        'We take reasonable precautions to protect your personal information from unauthorized access or disclosure. We store your data securely and only share it with third parties when required for service fulfillment (e.g., sending confirmation emails, etc.).\n\n'
                        '4. **Third-Party Services:**\n\n'
                        'We do not sell or rent your personal information to third parties. However, we may share your information with trusted partners who help us in providing services or operate our business, but only under strict confidentiality agreements.\n\n'
                        '5. **Changes to Privacy Policy:**\n\n'
                        'We reserve the right to update this privacy policy at any time. Any changes will be reflected in this document, and the updated policy will be posted on this page. We encourage you to review it periodically.\n\n'
                        '6. **Contact Us:**\n\n'
                        'If you have any questions regarding this Privacy Policy, please contact us at support@door2door.com or call +1 234 567 890.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
