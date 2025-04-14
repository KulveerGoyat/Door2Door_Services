import 'package:flutter/material.dart';

import '../../../Constants/image_strings.dart';
import '../../../Constants/size.dart';
import '../../../Widgets/professional_widget.dart';

class PetCareWorkersList extends StatelessWidget {
  final bool isDarkMode;

  const PetCareWorkersList({super.key, required this.isDarkMode,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfessionalWidget(
          image: professionalPetCare1,
          isDarkMode: isDarkMode,
          professionalName: "Vikram Singh",
          experience: "18 Years in Business",
          rating: "4.5",
          noOfRatings: "135",
          timeAvailability: "9",
          location: "Sector 17, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPetCare2,
          isDarkMode: isDarkMode,
          professionalName: "Neha Sharma",
          experience: "15 Years in Business",
          rating: "4.7",
          noOfRatings: "180",
          timeAvailability: "8:30",
          location: "Sector 22, Chandigarh",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPetCare3,
          isDarkMode: isDarkMode,
          professionalName: "Rajesh Kumar",
          experience: "12 Years in Business",
          rating: "4.3",
          noOfRatings: "100",
          timeAvailability: "10",
          location: "Panchkula, Haryana",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPetCare4,
          isDarkMode: isDarkMode,
          professionalName: "Meera Kapoor",
          experience: "20 Years in Business",
          rating: "4.6",
          noOfRatings: "160",
          timeAvailability: "7:30",
          location: "Sector 81, Mohali",
        ),
        SizedBox(height: defaultSize - 10.0),
        ProfessionalWidget(
          image: professionalPetCare5,
          isDarkMode: isDarkMode,
          professionalName: "Rohit Verma",
          experience: "22 Years in Business",
          rating: "4.8",
          noOfRatings: "200",
          timeAvailability: "9:30",
          location: "Mohali, Punjab",
        ),
        SizedBox(height: defaultSize - 10.0),
      ],
    );
  }
}
