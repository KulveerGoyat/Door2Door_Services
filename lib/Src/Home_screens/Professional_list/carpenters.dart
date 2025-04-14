
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class CarpenterWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const CarpenterWorkersList({super.key, required this.isDarkMode,});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalCarpenter1,
          isDarkMode: isDarkMode,
          professionalName: "Ss Interior",
          experience: "10 Years in Business",
          rating: "3.5",
          noOfRatings: "6",
          timeAvailability: "6",
          location: "Sector 45, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalCarpenter2,
          isDarkMode: isDarkMode,
          professionalName: "Mind Carpentry",
          experience: "10 Years in Business",
          rating: "4.8",
          noOfRatings: "150",
          timeAvailability: "10",
          location: "Dhakoli, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalCarpenter3,
          isDarkMode: isDarkMode,
          professionalName: "Tasleem Carpenter",
          experience: "7 Years in Business",
          rating: "4.1",
          noOfRatings: "70",
          timeAvailability: "9",
          location: "Sector 45b, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalCarpenter4,
          isDarkMode: isDarkMode,
          professionalName: "Sabir Carpenter",
          experience: "10 Years in Business",
          rating: "4.0",
          noOfRatings: "28",
          timeAvailability: "7",
          location: "Sector 16, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalCarpenter5,
          isDarkMode: isDarkMode,
          professionalName: "Rashpal Singh",
          experience: "5 Years in Business",
          rating: "3.5",
          noOfRatings: "82",
          timeAvailability: "8:30",
          location: "Sector 82, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}