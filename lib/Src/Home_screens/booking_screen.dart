import 'package:Door2Door_Services/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../Widgets/booking_body_widget.dart';
import '../../Widgets/booking_footer_widget.dart';
import '../../Widgets/booking_head_widget.dart';

class BookingScreen extends StatelessWidget {
  final String image;
  final String professionalName;
  final String description;
  final String rating;
  final String noOfRatings;
  final String timeAvailability;
  final String experience;
  final String location;

  const BookingScreen({
    super.key,
    required  this.image,
    required  this.professionalName,
    required this.description,
    required this.rating,
    required this.noOfRatings,
    required this.timeAvailability,
    required this.experience,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode? secondaryColor : primaryColor ,
      appBar: AppBar(
        backgroundColor:isDarkMode? secondaryColor : primaryColor ,
        title: Text("Book a Professional"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingHeadWidget(
                image: image,
                professionalName: professionalName,
                rating: rating,
                noOfRatings: noOfRatings,
                width: width,
                isDarkMode: isDarkMode,
                height: height,
            ),
            BookingBodyWidget(
              width: width,
              professionalName: professionalName , experience: experience,timeAvailability: timeAvailability, location: location,),
          ],
        ),
      ),
      bottomNavigationBar: BookingFooterWidget( isDarkMode: isDarkMode, image: image,
        professionalName: professionalName,),
    );
  }
}


