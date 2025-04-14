import 'package:Door2Door_Services/Src/Home_screens/settings_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/user_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../Constants/colors.dart';
import '../../Constants/image_strings.dart';
import '../../Constants/size.dart';
import '../../Database/firebase_services.dart';
import '../../Widgets/profile_menu_widget.dart';
import '../LogIn_Signup_screens/signup_controller.dart';
import '../Startup_screens/welcome_screen.dart';
import 'Professional_list/show_booking_screen.dart';
import 'about_screen.dart';
import 'update_profile.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final auth = AuthService();
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    // Fetch user data when the screen is built
    signUpController.fetchUserData();

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title:
        Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDarkMode ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(userImg),),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor),
                      child: const Icon(
                        LineAwesomeIcons.pencil_alt_solid,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(signUpController.name.value,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(signUpController.email.value,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                );
              }),
              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? primaryColor : secondaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text("Edit Profile",
                      style: TextStyle(color: isDarkMode ? Colors.black54 : primaryColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                  title: "Bookings",
                  icon: LineAwesomeIcons.calculator_solid,
                  onPress: () => Get.to(ShowBookingScreen())),
              ProfileMenuWidget(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog_solid,
                  onPress: () => Get.to(SettingsScreen())),
              ProfileMenuWidget(
                  title: "Billing Details",
                  icon: LineAwesomeIcons.wallet_solid,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: LineAwesomeIcons.user_check_solid,
                  onPress: () => Get.to(PrivacyPolicyScreen())),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info_solid,
                  onPress: () => Get.to(AboutScreen())),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.sign_solid,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await auth.signOut();
                            Get.off(() => const WelcomeScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
