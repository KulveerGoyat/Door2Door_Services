
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';
class PoolCleanersList extends StatelessWidget {
  final bool isDarkMode;

  const PoolCleanersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalPoolCleaning1,
          isDarkMode: isDarkMode,
          professionalName: "Vijay Kumar",
          experience: "10 Years in Business",
          rating: "4.5",
          noOfRatings: "60",
          timeAvailability: "7",
          location: "Sector 37c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalPoolCleaning2,
          isDarkMode: isDarkMode,
          professionalName: "Rajat Sharma",
          experience: "4 Years in Business",
          rating: "4.1",
          noOfRatings: "120",
          timeAvailability: "6",
          location: "Sector 22, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalPoolCleaning3,
          isDarkMode: isDarkMode,
          professionalName: "Ashish Yadav",
          experience: "2 Years in Business",
          rating: "2.5",
          noOfRatings: "34",
          timeAvailability: "9",
          location: "Sector 8, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}