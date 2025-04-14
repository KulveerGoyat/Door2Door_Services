import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/image_strings.dart';

class BookingHeadWidget extends StatelessWidget {
  const BookingHeadWidget({
    super.key,
    required this.width,
    required this.isDarkMode,
    required this.height,
    required this.noOfRatings,
    required this.professionalName,
    required this.rating,
    required this.image,

  });

  final double width;
  final bool isDarkMode;
  final double height;
  final String noOfRatings;
  final String professionalName;
  final String rating;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image(
            image: AssetImage(image),
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              professionalName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.08,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
            ),
            SizedBox(width: width * 0.02),
            Icon(
              Icons.verified,
              color: Colors.blueAccent,
              size: width * 0.08,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.005),
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
                color: isDarkMode ? Colors.white70 : Colors.black54,
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
      ],
    );
  }
}
