
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class ExteriorDesignWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const ExteriorDesignWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalExteriorDesign1,
          isDarkMode: isDarkMode,
          professionalName: "Ktc Urban Exteriors",
          experience: "10 Years in Business",
          rating: "4.5",
          noOfRatings: "25",
          timeAvailability: "10",
          location: "Gmada Aerocity, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0),    ProfessionalWidget(
          image: professionalExteriorDesign4,
          isDarkMode: isDarkMode,
          professionalName: "Jindal Architects",
          experience: "10 Years in Business",
          rating: "4.9",
          noOfRatings: "8",
          timeAvailability: "9:30",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),    ProfessionalWidget(
          image: professionalExteriorDesign2,
          isDarkMode: isDarkMode,
          professionalName: "KN Professionals",
          experience: "13 Years in Business",
          rating: "4.3",
          noOfRatings: "45",
          timeAvailability: "9",
          location: "Dhakoli, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),    ProfessionalWidget(
          image: professionalExteriorDesign3,
          isDarkMode: isDarkMode,
          professionalName: "R R Creations",
          experience: "5 Years in Business",
          rating: "4.2",
          noOfRatings: "55",
          timeAvailability: "9",
          location: "Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}