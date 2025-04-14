
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class ShiftingWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const ShiftingWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalShifting1,
          isDarkMode: isDarkMode,
          professionalName: "Agarwal Movers",
          experience: "25 Years in Business",
          rating: "4.7",
          noOfRatings: "286",
          timeAvailability: "9",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalShifting2,
          isDarkMode: isDarkMode,
          professionalName: "Allied Movers",
          experience: "37 Years in Business",
          rating: "3.7",
          noOfRatings: "120",
          timeAvailability: "8",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalShifting3,
          isDarkMode: isDarkMode,
          professionalName: "Accurate Packers",
          experience: "25 Years in Business",
          rating: "4.8",
          noOfRatings: "36",
          timeAvailability: "7",
          location: "Sector 26, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalShifting4,
          isDarkMode: isDarkMode,
          professionalName: "Himalayan Movers",
          experience: "39 Years in Healthcare",
          rating: "4.9",
          noOfRatings: "28",
          timeAvailability: "9",
          location: "Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}