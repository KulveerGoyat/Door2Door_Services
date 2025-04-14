
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalDoc1,
          isDarkMode: isDarkMode,
          professionalName: "Dr Vijay Chopra",
          experience: "45 Years in Healthcare",
          rating: "4.5",
          noOfRatings: "60",
          timeAvailability: "9",
          location: "Sector 37c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc5,
          isDarkMode: isDarkMode,
          professionalName: "Goyal Medical Clinic",
          experience: "20 Years in Healthcare",
          rating: "4.3",
          noOfRatings: "50",
          timeAvailability: "8",
          location: "Sector 4, Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc8,
          isDarkMode: isDarkMode,
          professionalName: "Excel Ent Centre",
          experience: "12 Years in Healthcare",
          rating: "4.8",
          noOfRatings: "750",
          timeAvailability: "7",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc6,
          isDarkMode: isDarkMode,
          professionalName: "Dr. S K Bhandari",
          experience: "39 Years in Healthcare",
          rating: "4.0",
          noOfRatings: "28",
          timeAvailability: "9",
          location: "Sector 36b, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc4,
          isDarkMode: isDarkMode,
          professionalName: "Dr. Sankalp Sharma",
          experience: "16 Years in Healthcare",
          rating: "5.0",
          noOfRatings: "82",
          timeAvailability: "8:30",
          location: "Sector 82, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc7,
          isDarkMode: isDarkMode,
          professionalName: "Dr. Gaurav Palikhe",
          experience: "20 Years in Healthcare",
          rating: "4.8",
          noOfRatings: "24",
          timeAvailability: "6",
          location: "Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc3,
          isDarkMode: isDarkMode,
          professionalName: "Dr. Bisht",
          experience: "17 Years in Healthcare",
          rating: "2.8",
          noOfRatings: "20",
          timeAvailability: "5:30",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc2,
          isDarkMode: isDarkMode,
          professionalName: "Dr. Mac",
          experience: "10 Years in Healthcare",
          rating: "4.2",
          noOfRatings: "835",
          timeAvailability: "7:30",
          location: "Sector 20c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalDoc9,
          isDarkMode: isDarkMode,
          professionalName: "Dr Pardeep Sharma",
          experience: "25 Years in Healthcare",
          rating: "4.4",
          noOfRatings: "630",
          timeAvailability: "6",
          location: "Sector 38, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}