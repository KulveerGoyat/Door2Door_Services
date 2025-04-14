import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class EventPlannersList extends StatelessWidget {
  final bool isDarkMode;

  const EventPlannersList({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalEventPlanning1,
          isDarkMode: isDarkMode,
          professionalName: "Event Mastermind",
          experience: "10 Years in Business",
          rating: "4.6",
          noOfRatings: "120",
          timeAvailability: "9",
          location: "Sector 37C, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalEventPlanning2,
          isDarkMode: isDarkMode,
          professionalName: "Royal Event Planners",
          experience: "15 Years in Business",
          rating: "4.8",
          noOfRatings: "200",
          timeAvailability: "10",
          location: "Sector 4, Panchkula",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalEventPlanning3,
          isDarkMode: isDarkMode,
          professionalName: "Elite Weddings",
          experience: "12 Years in Business",
          rating: "4.7",
          noOfRatings: "150",
          timeAvailability: "9",
          location: "Phase 8, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalEventPlanning4,
          isDarkMode: isDarkMode,
          professionalName: "Celebration Planners",
          experience: "18 Years in Business",
          rating: "4.9",
          noOfRatings: "250",
          timeAvailability: "9",
          location: "Sector 36B, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalEventPlanning5,
          isDarkMode: isDarkMode,
          professionalName: "The Designers",
          experience: "8 Years in Business",
          rating: "4.4",
          noOfRatings: "95",
          timeAvailability: "10",
          location: "Sector 82, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalEventPlanning6,
          isDarkMode: isDarkMode,
          professionalName: "Prestige Events",
          experience: "20 Years in Business",
          rating: "5.0",
          noOfRatings: "320",
          timeAvailability: "9",
          location: "Panchkula",
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}
