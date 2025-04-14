
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class PaintersList extends StatelessWidget {
  final bool isDarkMode;

  const PaintersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalPainting1,
          isDarkMode: isDarkMode,
          professionalName: "Rashid Contractors",
          experience: "43 Years in Business",
          rating: "4.2",
          noOfRatings: "14",
          timeAvailability: "10",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),  ProfessionalWidget(
          image: professionalPainting2,
          isDarkMode: isDarkMode,
          professionalName: "Shankar Kumar",
          experience: "7 Years in Business",
          rating: "4.2",
          noOfRatings: "49",
          timeAvailability: "7",
          location: "Sector 45b, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),  ProfessionalWidget(
          image: professionalPainting3,
          isDarkMode: isDarkMode,
          professionalName: "Pro Assist",
          experience: "5 Years in Business",
          rating: "4.5",
          noOfRatings: "14",
          timeAvailability: "10",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),  ProfessionalWidget(
          image: professionalPainting4,
          isDarkMode: isDarkMode,
          professionalName: "Jay Kumar",
          experience: "17 Years in Business",
          rating: "4.2",
          noOfRatings: "34",
          timeAvailability: "10",
          location: "Sector 45, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),  ProfessionalWidget(
          image: professionalPainting5,
          isDarkMode: isDarkMode,
          professionalName: "Vinod Painter",
          experience: "3 Years in Business",
          rating: "4.2",
          noOfRatings: "14",
          timeAvailability: "6",
          location: "Phase 6, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0),  ProfessionalWidget(
          image: professionalPainting6,
          isDarkMode: isDarkMode,
          professionalName: "Subhash Painter",
          experience: "10 Years in Business",
          rating: "3.8",
          noOfRatings: "8",
          timeAvailability: "7",
          location: "Janta Nagar, Kharar" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}