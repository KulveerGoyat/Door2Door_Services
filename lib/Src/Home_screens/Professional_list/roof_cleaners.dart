
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class RoofCleanersList extends StatelessWidget {
  final bool isDarkMode;

  const RoofCleanersList({super.key, required this.isDarkMode,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalRoofCleaner1,
          isDarkMode: isDarkMode,
          professionalName: "Ashok Sharma",
          experience: "45 Years in Healthcare",
          rating: "2.5",
          noOfRatings: "60",
          timeAvailability: "9",
          location: "Sector 17c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalRoofCleaner2,
          isDarkMode: isDarkMode,
          professionalName: "Tanjim",
          experience: "20 Years in Healthcare",
          rating: "4.3",
          noOfRatings: "50",
          timeAvailability: "8",
          location: "Sector 4, Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalRoofCleaner3,
          isDarkMode: isDarkMode,
          professionalName: "Sumit Kumar",
          experience: "12 Years in Healthcare",
          rating: "4.8",
          noOfRatings: "750",
          timeAvailability: "7",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}