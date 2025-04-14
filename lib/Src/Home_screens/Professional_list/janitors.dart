import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class JanitorWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const JanitorWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalJanitor1,
          isDarkMode: isDarkMode,
          professionalName: "Anjali Maids",
          experience: "5 Years in Business",
          rating: "4.7",
          noOfRatings: "145",
          timeAvailability: "9",
          location: "Sector 37c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalJanitor2,
          isDarkMode: isDarkMode,
          professionalName: "Lakshmi Home Care",
          experience: "5 Years in Business",
          rating: "4.2",
          noOfRatings: "98",
          timeAvailability: "8",
          location: "Sector 4, Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalJanitor3,
          isDarkMode: isDarkMode,
          professionalName: "Jyoti Clean Team",
          experience: "5 Years in Business",
          rating: "4.9",
          noOfRatings: "620",
          timeAvailability: "7",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalJanitor4,
          isDarkMode: isDarkMode,
          professionalName: "Radha's Cleaner",
          experience: "5 Years in Business",
          rating: "4.1",
          noOfRatings: "34",
          timeAvailability: "9",
          location: "Sector 36b, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalJanitor5,
          isDarkMode: isDarkMode,
          professionalName: "Shanti Housekeeping",
          experience: "5 Years in Business",
          rating: "4.8",
          noOfRatings: "200",
          timeAvailability: "8:30",
          location: "Sector 82, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}
