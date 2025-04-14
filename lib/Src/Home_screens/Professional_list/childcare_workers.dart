import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class ChildcareWorkersList extends StatelessWidget {

  final bool isDarkMode;

  const ChildcareWorkersList({super.key,
    required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalChildcare1,
          isDarkMode: isDarkMode,
          professionalName: "Aarti Gupta",
          experience: "10 Years in Childcare",
          rating: "4.5",
          noOfRatings: "150",
          timeAvailability: "9",
          location: "Sector 37C, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChildcare2,
          isDarkMode: isDarkMode,
          professionalName: "Childcare Experts",
          experience: "8 Years in Childcare",
          rating: "4.7",
          noOfRatings: "100",
          timeAvailability: "10",
          location: "Sector 4, Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChildcare3,
          isDarkMode: isDarkMode,
          professionalName: "Little Stars Childcare",
          experience: "12 Years in Childcare",
          rating: "4.8",
          noOfRatings: "200",
          timeAvailability: "8",
          location: "Phase 8, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChildcare4,
          isDarkMode: isDarkMode,
          professionalName: "Precious Kids Care",
          experience: "15 Years in Childcare",
          rating: "5.0",
          noOfRatings: "180",
          timeAvailability: "9",
          location: "Sector 36B, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChildcare5,
          isDarkMode: isDarkMode,
          professionalName: "Happy Tots Childcare",
          experience: "10 Years in Childcare",
          rating: "4.6",
          noOfRatings: "120",
          timeAvailability: "10",
          location: "Sector 82, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}
