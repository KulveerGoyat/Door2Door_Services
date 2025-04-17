import 'package:Door2Door_Services/Constants/colors.dart';
import 'package:Door2Door_Services/Constants/image_strings.dart';
import 'package:Door2Door_Services/Constants/size.dart';
import 'package:Door2Door_Services/Src/Home_screens/Professional_list/show_booking_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/about_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/settings_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/update_profile.dart';
import 'package:Door2Door_Services/Src/Home_screens/user_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';
import '../../Constants/text_strings.dart';
import '../../Database/firebase_services.dart';
import '../../Widgets/home_page_category_widget.dart';
import '../../Widgets/home_page_highlight_widget.dart';
import '../../Widgets/popular_services_widget.dart';
import '../../Widgets/profile_menu_widget.dart';
import '../Startup_screens/welcome_screen.dart';



class ExploreScreen extends StatefulWidget {
 const ExploreScreen({super.key});


  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> imgList = [
    homeSliderImg1,
    homeSliderImg2,
    homeSliderImg3,
    homeSliderImg4,
    homeSliderImg5,
  ];

  int _currentIndex = 0;
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(highlightVid)
      ..setLooping(true)
      ..setVolume(0)
      ..initialize();
    _initializeVideoPlayerFuture = _videoController.initialize().then((_) {
      if (mounted) {
        setState(() {});
        _videoController.play();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
          icon: Icon(LineAwesomeIcons.user_ninja_solid , color:isDarkMode ? primaryColor : secondaryColor,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),

      ),
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      drawer: Drawer(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SingleChildScrollView(
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
                       child: SvgPicture.asset(userImg),
                    ),
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
              Text(developer,
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Kulveergoyat1@gmail.com",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
          
              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode? primaryColor : secondaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text("Edit Profile",
                      style: TextStyle(color: isDarkMode? Colors.black54 : primaryColor ,)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
          
              /// -- MENU
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
                      backgroundColor: Colors.white, // White background for the dialog
                      title: "LOGOUT",
                      titleStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Title color black
                      ),
                      content: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Are you sure, you want to Logout?",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              onPressed: () => Get.back(),
                              child: Text(
                                "No",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            // "Yes" Button (confirm)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              onPressed: () async {
                                await auth.signOut();
                                Get.off(() => const WelcomeScreen());
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
                ),
              ),
          ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultSize - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: isDarkMode ? primaryColor : secondaryColor,
                  ),
                  Text(
                    "Mohali , India",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: defaultSize - 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: defaultSize - 20.0),
              Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: width,
                  decoration: BoxDecoration(
                    color: isDarkMode ? secondaryColor : containerBg,
                    border: Border.all(
                      color: isDarkMode ? primaryColor : secondaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: imgList.length,
                        itemBuilder: (context, index, realIndex) {
                          return SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: SvgPicture.asset(
                              imgList[index],
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          aspectRatio: 16 / 9,
                          autoPlayInterval: Duration(seconds: 3),
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: AnimatedSmoothIndicator(
                            activeIndex: _currentIndex,
                            count: imgList.length,
                            effect: SwapEffect(
                              dotHeight: 8.0,
                              dotWidth: 8.0,
                              radius: 5.0,
                              spacing: 10.0,
                              dotColor: Colors.grey,
                              activeDotColor: primaryColor,
                              type: SwapType.yRotation,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: defaultSize - 20.0),
              Material(
                color: isDarkMode ? secondaryColor : primaryColor,
                child: CategoryWidget(isDarkMode: isDarkMode, width: width),
              ),
              SizedBox(
                height: defaultSize - 20.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 1.0,
                child: HightlightWidget(
                    isDarkMode: isDarkMode,
                    initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
                    videoController: _videoController),
              ),
              SizedBox(height: defaultSize - 20,),
              PopularServiceWidget(isDarkMode: isDarkMode, width: width),
              SizedBox(height: defaultSize),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SvgPicture.asset( helpImg,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,))
                ),
            ],
          ),
        ),
      ),
    );
  }
}

