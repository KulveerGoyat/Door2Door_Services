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
  final BookingController controller = Get.put(BookingController());

  @override
  void initState() {
    super.initState();
    controller.fetchBookings();
  }

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
        title: Text("Bookings", style: Theme.of(context).textTheme.headlineMedium),
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left_solid),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.bookings.isEmpty) {
          return Center(
            child: Text(
              "No Data Found!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: controller.bookings.length,
          itemBuilder: (context, index) {
            var booking = controller.bookings[index];
            var image = booking['image'] ?? '';
            var name = booking['professional_name'] ?? '';
            var date = booking['date'] ?? '';
            var time = booking['time'] ?? '';

            return InkWell(
              onLongPress: () async {
                bool? confirmDelete = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Text(
                      "Cancel Booking",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    content: Text(
                      "Do you want to cancel this booking?",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    actionsPadding: EdgeInsets.only(bottom: 10, right: 10),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () => Navigator.pop(context, false),
                        child: Text("No", style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () => Navigator.pop(context, true),
                        child: Text("Yes", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
                if (confirmDelete == true) {
                  await controller.deleteBooking(booking['id']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Booking cancelled")),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Material(
                  color: isDarkMode ? secondaryColor : containerBg,
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
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
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                image.isNotEmpty ? image : petCareImg,
                                height: height * 0.12,
                                width: width * 0.25,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.05,
                                          color: isDarkMode ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.verified, color: Colors.blueAccent),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(LineAwesomeIcons.calendar, color: isDarkMode ? primaryColor : secondaryColor),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Scheduled At",
                                        style: TextStyle(
                                          color: isDarkMode ? Colors.yellow.shade300 : secondaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "$date • $time",
                                    style: TextStyle(
                                      color: isDarkMode ? Colors.yellow.shade300 : secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Booking Status: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.045,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              "Confirmed",
                              style: TextStyle(
                                color: isDarkMode ? Colors.greenAccent : Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.045,
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
          },
        );
      }),
    );
  }
}
