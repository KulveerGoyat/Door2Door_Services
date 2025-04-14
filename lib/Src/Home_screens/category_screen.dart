import 'package:Door2Door_Services/Constants/colors.dart';
import 'package:Door2Door_Services/Src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../Constants/image_strings.dart';
import '../../Constants/size.dart';
import '../../Constants/text_strings.dart';
import '../../Widgets/popular_widgets.dart';
import '../../Widgets/services_container_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
            onPressed: () => Get.off(
                  HomeScreen(),
                ),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
      ),
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "30",
                      price: "560",
                      descriptionText: tutor,
                      offPrice: "800",
                      offColor: Colors.orangeAccent,
                      img: tutorImg,
                      servicesText: "Home Tutoring",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "40",
                      price: "1200",
                      offPrice: "2000",
                      descriptionText: carpenter,
                      offColor: Colors.orangeAccent,
                      img: carpenterImg,
                      servicesText: "Carpenter",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: docImg2,
                      servicesText: "Doctor",
                      fontSize: 18.0,
                      descriptionText: doc,
                      imageHeight: 150.0),
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      descriptionText: roof,
                      off: "70",
                      price: "240",
                      offPrice: "800",
                      offColor: Colors.greenAccent,
                      img: roofImg,
                      servicesText: "Roof Cleaning",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "30",
                      price: "630",
                      descriptionText: cleaning,
                      offPrice: "900",
                      offColor: Colors.greenAccent,
                      img: cleanImg,
                      servicesText: "Janitor",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      descriptionText: gardening,
                      img: gardenImg,
                      servicesText: "Gardener",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: floorImg,
                      servicesText: "Flooring",
                      descriptionText: flooring,
                      fontSize: 18.0,
                      imageHeight: 150.0),
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "20",
                      descriptionText: chef,
                      price: "400",
                      offPrice: "500",
                      offColor: Colors.blueAccent,
                      img: chefImg,
                      servicesText: "Chef",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,

                      img: petCareImg,
                      descriptionText: petCare,
                      servicesText: "Pet Care",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: electricImg,
                      servicesText: "Electrician",
                      fontSize: 18.0,
                      descriptionText: electrician,
                      imageHeight: 150.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: acImg,
                      descriptionText: acRepair,
                      servicesText: "Ac Services",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: moveImg,
                      servicesText: "Shifting",
                      fontSize: 18.0,
                      descriptionText: moving,
                      imageHeight: 150.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: pestImg,
                      descriptionText: pestControl,
                      servicesText: "Pest Control",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: paintImg,
                      descriptionText: painting,
                      servicesText: "Painter",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "40",
                      descriptionText: salonParlor,
                      price: "1080",
                      offPrice: "1800",
                      offColor: Colors.greenAccent,
                      img: parlorImg,
                      servicesText: "Beautician",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      descriptionText: construction,
                      img: constructionImg,
                      servicesText: "Exterior Design",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: poolImg,
                      servicesText: "Pool Cleaning",
                      descriptionText: pool,
                      fontSize: 18.0,
                      imageHeight: 150.0),
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "20",
                      descriptionText: event,
                      price: "2400",
                      offPrice: "3000",
                      offColor: Colors.blueAccent,
                      img: eventImg,
                      servicesText: "Event Planning",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopularWidget(
                      width: width / 2.5,
                      height: 200.0,
                      off: "40",
                      descriptionText: childcare,
                      price: "420",
                      offPrice: "700",
                      offColor: Colors.orangeAccent,
                      img: childImg,
                      servicesText: "Child Care",
                      fontSize: 18.0,
                      imageHeight: 115.0),
                  ServicesContainerWidget(
                      width: width / 2.5,
                      height: 200.0,
                      img: plumberImg,
                      descriptionText: plumber,
                      servicesText: "Plumber",
                      fontSize: 18.0,
                      imageHeight: 150.0),
                ],
              ),
              SizedBox(
                height: defaultSize - 10,
              ),
              SizedBox(
                width: defaultSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
