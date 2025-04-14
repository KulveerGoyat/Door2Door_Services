
import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class BeauticiansList extends StatelessWidget {
  final bool isDarkMode;

  const BeauticiansList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalBeautician1,
          isDarkMode: isDarkMode,
          professionalName: "Villa Hair Sense",
          experience: "16 Years in Business",
          rating: "4.5",
          noOfRatings: "376",
          timeAvailability: "8",
          location: "Sector 9, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),ProfessionalWidget(
          image: professionalBeautician2,
          isDarkMode: isDarkMode,
          professionalName: "Naomi's Parlor",
          experience: "6 Years in Business",
          rating: "4.7",
          noOfRatings: "651",
          timeAvailability: "8:30",
          location: "Sector 7c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),ProfessionalWidget(
          image: professionalBeautician3,
          isDarkMode: isDarkMode,
          professionalName: "London Luxury Salon",
          experience: "5 Years in Business",
          rating: "4.1",
          noOfRatings: "665",
          timeAvailability: "9",
          location: "Sector 8c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),ProfessionalWidget(
          image: professionalBeautician4,
          isDarkMode: isDarkMode,
          professionalName: "Beauty Parlour",
          experience: "2 Years in Business",
          rating: "4.9",
          noOfRatings: "114",
          timeAvailability: "8:30",
          location: "Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),ProfessionalWidget(
          image: professionalBeautician5,
          isDarkMode: isDarkMode,
          professionalName: "Renume Luxury",
          experience: "23 Years in Business",
          rating: "4.4",
          noOfRatings: "107",
          timeAvailability: "9",
          location: "Sector 35c, Chandigarh" ,
        ),
        SizedBox(height: defaultSize - 10.0),ProfessionalWidget(
          image: professionalBeautician6,
          isDarkMode: isDarkMode,
          professionalName: "Meenakshi Parlor",
          experience: "1 Years in Business",
          rating: "4.9",
          noOfRatings: "129",
          timeAvailability: "10",
          location: "Sector 35, Candigarh",
        ),
        SizedBox(height: defaultSize - 10.0),ProfessionalWidget(
          image: professionalBeautician7,
          isDarkMode: isDarkMode,
          professionalName: "Head Masters",
          experience: "12 Years in business",
          rating: "4.5",
          noOfRatings: "76",
          timeAvailability: "8",
          location: "Sector 35b, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}