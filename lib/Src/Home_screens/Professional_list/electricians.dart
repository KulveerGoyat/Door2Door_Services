
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class ElectriciansList extends StatelessWidget {
  final bool isDarkMode;

  const ElectriciansList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalElectrician1,
          isDarkMode: isDarkMode,
          professionalName: "Sachdeva Electronic",
          experience: "25 Years in Business",
          rating: "4.0",
          noOfRatings: "482",
          timeAvailability: "9",
          location: "Sector 31, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image:professionalElectrician2,
          isDarkMode: isDarkMode,
          professionalName: "Ruhani Electrician",
          experience: "21 Years in Business",
          rating: "4.1",
          noOfRatings: "50",
          timeAvailability: "8",
          location: "Phase 8, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalElectrician3,
          isDarkMode: isDarkMode,
          professionalName: "Bholey Electricals",
          experience: "14 Years in Business",
          rating: "4.2",
          noOfRatings: "70",
          timeAvailability: "8",
          location: "Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalElectrician4,
          isDarkMode: isDarkMode,
          professionalName: "Annanya Electrical",
          experience: "7 Years in Business",
          rating: "3.5",
          noOfRatings: "28",
          timeAvailability: "9",
          location: "Sector 91, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalElectrician5,
          isDarkMode: isDarkMode,
          professionalName: "Manu Electrician",
          experience: "12 Years in Business",
          rating: "5.0",
          noOfRatings: "82",
          timeAvailability: "9",
          location: "Sector 45b, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalElectrician6,
          isDarkMode: isDarkMode,
          professionalName: "Apex Electricals",
          experience: "13 Years in Business",
          rating: "4.2",
          noOfRatings: "24",
          timeAvailability: "8",
          location: "Sector 18, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}