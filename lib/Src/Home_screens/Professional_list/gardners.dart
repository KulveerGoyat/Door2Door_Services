
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class GardenersList extends StatelessWidget {
  final bool isDarkMode;
  const GardenersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalGardener1,
          isDarkMode: isDarkMode,
          professionalName: "Grow Plant Studio",
          experience: "5 Years in Business",
          rating: "4.5",
          noOfRatings: "20",
          timeAvailability: "7",
          location: "Landran, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalGardener2,
          isDarkMode: isDarkMode,
          professionalName: "Mh Landscaper",
          experience: "25 Years in Business",
          rating: "4.0",
          noOfRatings: "50",
          timeAvailability: "8",
          location: "Sector 55, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalGardener3,
          isDarkMode: isDarkMode,
          professionalName: "Ocimum Landscaping",
          experience: "6 Years in Business",
          rating: "4.8",
          noOfRatings: "7",
          timeAvailability: "8",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalGardener4,
          isDarkMode: isDarkMode,
          professionalName: "Local Garden",
          experience: "8 Years in Business",
          rating: "4.2",
          noOfRatings: "28",
          timeAvailability: "9",
          location: "Sigma City, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}