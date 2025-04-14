
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class HomeTutorsList extends StatelessWidget {
  final bool isDarkMode;

  const HomeTutorsList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalTutor1,
          isDarkMode: isDarkMode,
          professionalName: "Modiv's Tuitions",
          experience: "15 Years in Teaching",
          rating: "4.6",
          noOfRatings: "175",
          timeAvailability: "11",
          location: "Sector 34, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalTutor2,
          isDarkMode: isDarkMode,
          professionalName: "Oxford Home Tuitions",
          experience: "6 Years in Teaching",
          rating: "4.3",
          noOfRatings: "502",
          timeAvailability: "8:30",
          location: "Sector 14, Panchkula" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalTutor7,
          isDarkMode: isDarkMode,
          professionalName: "Pankaj Academy",
          experience: "12 Years in Teaching",
          rating: "3.8",
          noOfRatings: "75",
          timeAvailability: "7",
          location: "Sector 119, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalTutor5,
          isDarkMode: isDarkMode,
          professionalName: "Mr Vikas Kumar",
          experience: "6 Years in Teaching",
          rating: "4.7",
          noOfRatings: "28",
          timeAvailability: "9",
          location: "Sector 28a, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalTutor6,
          isDarkMode: isDarkMode,
          professionalName: "Dynamic Tutors",
          experience: "16 Years in Teaching",
          rating: "4.4",
          noOfRatings: "117",
          timeAvailability: "10",
          location: "Sector 82, Mohali" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalTutor4,
          isDarkMode: isDarkMode,
          professionalName: "Jahnvi's Classes",
          experience: "20 Years in Teaching",
          rating: "4.3",
          noOfRatings: "65",
          timeAvailability: "8",
          location: "Sector 20c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0), ProfessionalWidget(
          image: professionalTutor3,
          isDarkMode: isDarkMode,
          professionalName: "Welkin Home Tutors",
          experience: "10 Years in Teaching",
          rating: "3.5",
          noOfRatings: "230",
          timeAvailability: "5:30",
          location: "Baltana, Zirakpur" ,
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}