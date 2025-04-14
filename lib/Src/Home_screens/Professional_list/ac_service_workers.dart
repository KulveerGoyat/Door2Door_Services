
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class ACServiceWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const ACServiceWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalACService1,
          isDarkMode: isDarkMode,
          professionalName: "Nishant Ac Services",
          experience: "6 Years in Business",
          rating: "3.9",
          noOfRatings: "42",
          timeAvailability: "9:15",
          location: "Sector 38c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalACService2,
          isDarkMode: isDarkMode,
          professionalName: "M K Electricals",
          experience: "8 Years in Business",
          rating: "4.0",
          noOfRatings: "50",
          timeAvailability: "8",
          location: "Sector 34a, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalACService3,
          isDarkMode: isDarkMode,
          professionalName: "V K Refrigeration",
          experience: "24 Years in Business",
          rating: "4.3",
          noOfRatings: "73",
          timeAvailability: "7",
          location: "Sector 9d, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalACService4,
          isDarkMode: isDarkMode,
          professionalName: "Indra Services",
          experience: "15 Years in Business",
          rating: "4.1",
          noOfRatings: "58",
          timeAvailability: "11",
          location: "Sector 32, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}