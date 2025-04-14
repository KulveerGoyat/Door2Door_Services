import 'package:Door2Door_Services/Src/Home_screens/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';
import '../Constants/image_strings.dart';
import '../Src/Home_screens/favourites_controller.dart';

class ProfessionalWidget extends StatelessWidget {
  const ProfessionalWidget({
    super.key,
    required this.professionalName,
    required this.location,
    required this.timeAvailability,
    required this.rating,
    required this.image,
    required this.noOfRatings,
    required this.experience,
    required this.isDarkMode,
  });

  final String professionalName;
  final String location;
  final String timeAvailability;
  final String rating;
  final String image;
  final String noOfRatings;
  final String experience;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    final favouritesController = Get.put(FavouritesController());

    return InkWell(
      onDoubleTap: (){
        favouritesController.addToFavourites(
          professionalName: professionalName,
          image: image,
          rating: rating,
          noOfRatings: int.tryParse(noOfRatings) ?? 0,
          experience: experience,
          timeAvailability: timeAvailability,
          location: location,
        );
      },
      onTap: () {
       Get.to(() =>
            BookingScreen(
                image: image,
                professionalName: professionalName,
                description: "description",
                rating: rating,
                experience: experience,
                noOfRatings: noOfRatings,
                timeAvailability: timeAvailability,
                location: location));
      },
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: height * 0.25,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black87 : containerBg,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: isDarkMode ? primaryColor : secondaryColor,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Image(
                        image: AssetImage(image),
                        height: height * 0.12,
                        width: width * 0.25,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,)
                  ),
                  SizedBox(width: width * 0.015,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              professionalName,
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
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.005),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blueAccent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    rating,
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Icon(Icons.star, color: Colors.white),
                                ],
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              "$noOfRatings+ Ratings",
                              style: TextStyle(
                                fontSize: width * 0.035, // Scalable font size
                                color: isDarkMode ? Colors.white70 : Colors
                                    .black54,
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            SvgPicture.asset(
                              verifyImg,
                              height: height * 0.07,
                              width: width * 0.05,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.008),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: isDarkMode ? primaryColor : secondaryColor,
                            ),
                            SizedBox(width: width * 0.02),
                            // Spacing adjusted for responsiveness
                            Text(
                              location,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: isDarkMode ? Colors.white70 : Colors
                                    .black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: Colors.green),
                    SizedBox(width: width * 0.02),

                    Text(
                      "Available Till $timeAvailability PM",
                      style: TextStyle(
                        fontSize: width * 0.035, // Scalable font size
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    SizedBox(width: width * 0.02),

                    Text(
                      ".",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    SizedBox(width: width * 0.02),

                    Text(
                      experience,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
