import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/image_strings.dart';
import '../booking_controller.dart';

class ShowBookingScreen extends StatefulWidget {
  const ShowBookingScreen({super.key});

  @override
  ShowBookingScreenState createState() => ShowBookingScreenState();
}

class ShowBookingScreenState extends State<ShowBookingScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(BookingController());
    Get.find<BookingController>().fetchBookings();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var controller = Get.find<BookingController>();

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      appBar: AppBar(
        title: Text("Bookings", style: Theme.of(context).textTheme.headlineMedium),
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.bookings.isEmpty) {
          return Center(child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyLarge,));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: controller.bookings.map((booking) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Material(
                    color: isDarkMode ? secondaryColor : containerBg,
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 5,bottom: 5),

                      height: height * 0.22,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDarkMode ? secondaryColor : containerBg,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: isDarkMode ? primaryColor : secondaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    booking['image'] != null && booking['image'].isNotEmpty
                                        ? booking['image'] : petCareImg,
                                    height: height * 0.12,
                                    width: width * 0.25,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                SizedBox(width: width * 0.015),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            booking['professional_name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: width * 0.05,
                                              color: isDarkMode ? Colors.white : Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.02),
                                          Icon(Icons.verified, color: Colors.blueAccent),
                                        ],
                                      ),


                                      SizedBox(height: height * 0.008),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(LineAwesomeIcons.calculator_solid, color: isDarkMode ? primaryColor : secondaryColor),
                                              Text(
                                                "Scheduled AT ",
                                                style: TextStyle(
                                                  color: isDarkMode ? Colors.yellow.shade300 : secondaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.008),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                booking['date'],
                                                style: TextStyle(
                                                  color: isDarkMode ? Colors.yellow.shade300 : secondaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ), Text(
                                                booking['time'],
                                                style: TextStyle(
                                                  color: isDarkMode ? Colors.yellow.shade300 : secondaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.008),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Booking Status : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.05,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  "Confirmed",
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.greenAccent : Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );

              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
