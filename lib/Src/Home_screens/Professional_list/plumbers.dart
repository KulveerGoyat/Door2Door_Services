import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class PlumbersList extends StatelessWidget {
  final bool isDarkMode;

  const PlumbersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalPlumber1,
          isDarkMode: isDarkMode,
          professionalName: "Plumber Master",
          experience: "10 Years in Plumbing",
          rating: "4.5",
          noOfRatings: "120",
          timeAvailability: "9",
          location: "Sector 37C, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPlumber2,
          isDarkMode: isDarkMode,
          professionalName: "Fix It Plumbing",
          experience: "15 Years in Plumbing",
          rating: "4.7",
          noOfRatings: "150",
          timeAvailability: "8",
          location: "Sector 4, Panchkula",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPlumber3,
          isDarkMode: isDarkMode,
          professionalName: "Aqua Plumbers",
          experience: "12 Years in Plumbing",
          rating: "4.6",
          noOfRatings: "180",
          timeAvailability: "9",
          location: "Phase 8, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPlumber4,
          isDarkMode: isDarkMode,
          professionalName: "Quick Fix Plumbing",
          experience: "8 Years in Plumbing",
          rating: "4.8",
          noOfRatings: "100",
          timeAvailability: "10",
          location: "Sector 36B, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPlumber5,
          isDarkMode: isDarkMode,
          professionalName: "Plumber's Hub",
          experience: "20 Years in Plumbing",
          rating: "5.0",
          noOfRatings: "220",
          timeAvailability: "9",
          location: "Sector 82, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPlumber6,
          isDarkMode: isDarkMode,
          professionalName: "Reliable Plumbing",
          experience: "18 Years in Plumbing",
          rating: "4.9",
          noOfRatings: "200",
          timeAvailability: "8",
          location: "Panchkula",
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}
