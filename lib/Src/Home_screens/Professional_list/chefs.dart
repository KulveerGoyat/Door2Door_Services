import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class ChefsList extends StatelessWidget {
  final bool isDarkMode;

  const ChefsList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalChef1,
          isDarkMode: isDarkMode,
          professionalName: "Chef Rajeev Kumar",
          experience: "18 Years in North Indian",
          rating: "4.7",
          noOfRatings: "150",
          timeAvailability: "10",
          location: "Sector 35, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef2,
          isDarkMode: isDarkMode,
          professionalName: "Chef Neha Singh",
          experience: "15 Years in Mughlai",
          rating: "4.9",
          noOfRatings: "210",
          timeAvailability: "8",
          location: "Sector 17, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef3,
          isDarkMode: isDarkMode,
          professionalName: "Chef Arvind Sharma",
          experience: "12 Years in Street Food",
          rating: "4.3",
          noOfRatings: "95",
          timeAvailability: "7",
          location: "Panchkula, Haryana",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef4,
          isDarkMode: isDarkMode,
          professionalName: "Chef Pooja Verma",
          experience: "20 Years in South Indian",
          rating: "4.6",
          noOfRatings: "180",
          timeAvailability: "9",
          location: "Sector 82, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef5,
          isDarkMode: isDarkMode,
          professionalName: "Chef Ramesh Kumar",
          experience: "22 Years in Indian",
          rating: "4.8",
          noOfRatings: "180",
          timeAvailability: "10",
          location: "Mohali, Punjab",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef6,
          isDarkMode: isDarkMode,
          professionalName: "Chef Anjali Gupta",
          experience: "25 Years in Continental",
          rating: "4.4",
          noOfRatings: "120",
          timeAvailability: "11",
          location: "Sector 44, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef7,
          isDarkMode: isDarkMode,
          professionalName: "Chef Vivek Bansal",
          experience: "14 Years in Punjabi",
          rating: "4.2",
          noOfRatings: "65",
          timeAvailability: "6",
          location: "Panchkula, Haryana",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalChef8,
          isDarkMode: isDarkMode,
          professionalName: "Chef Sonali Mehra",
          experience: "10 Years in Vegetarian",
          rating: "4.5",
          noOfRatings: "90",
          timeAvailability: "8",
          location: "Mohali, Punjab",
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}
