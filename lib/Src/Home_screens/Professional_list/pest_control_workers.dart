
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class PestControlWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const PestControlWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalPestControl1,
          isDarkMode: isDarkMode,
          professionalName: "AK Pest Control",
          experience: "25 Years in Business",
          rating: "4.9",
          noOfRatings: "241",
          timeAvailability: "8",
          location: "Sas Nagar, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalPestControl2,
          isDarkMode: isDarkMode,
          professionalName: "Pest Resolver",
          experience: "14 Years in Business",
          rating: "4.7",
          noOfRatings: "255",
          timeAvailability: "10",
          location: "Dhakoli, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalPestControl3,
          isDarkMode: isDarkMode,
          professionalName: "Pestlogic India",
          experience: "8 Years in Business",
          rating: "4.8",
          noOfRatings: "750",
          timeAvailability: "7",
          location: "Sector 70, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}