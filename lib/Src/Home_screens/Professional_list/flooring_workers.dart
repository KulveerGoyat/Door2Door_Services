
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class FlooringWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const FlooringWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalFlooring1,
          isDarkMode: isDarkMode,
          professionalName: "J3 Accessories",
          experience: "15 Years in Business",
          rating: "4.0",
          noOfRatings: "60",
          timeAvailability: "7",
          location: "Mani Majra, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalFlooring2,
          isDarkMode: isDarkMode,
          professionalName: "Tile Wale",
          experience: "2 Years in Business",
          rating: "3.0",
          noOfRatings: "5",
          timeAvailability: "8",
          location: "Sector 82, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalFlooring3,
          isDarkMode: isDarkMode,
          professionalName: "Chandigarh Link",
          experience: "12 Years in Business",
          rating: "4.8",
          noOfRatings: "89",
          timeAvailability: "7",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}