import 'package:Door2Door_Services/Constants/text_strings.dart';
import 'package:Door2Door_Services/Widgets/popular_widgets.dart';
import 'package:flutter/material.dart';

import '../Constants/image_strings.dart';
import '../Constants/size.dart';
import '../Src/Home_screens/category_screen.dart';

class PopularServiceWidget extends StatelessWidget {
  const PopularServiceWidget({
    super.key,
    required this.isDarkMode,
    required this.width,
  });

  final bool isDarkMode;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Popular Services",
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: SizedBox()),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryScreen()));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blueAccent,
                    decorationThickness: 2.0,
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "20",
                  price: "400",
                  offPrice: "500",
                  descriptionText: chef,
                  offColor: Colors.blueAccent,
                  img: chefImg,
                  servicesText: "Chef",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "40",
                  price: "1080",
                  offPrice: "1800",
                  offColor: Colors.greenAccent,
                  img: parlorImg,
                  descriptionText: salonParlor,
                  servicesText: "Beautician",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "30",
                  price: "560",
                  offPrice: "800",
                  offColor: Colors.orangeAccent,
                  img: tutorImg,
                  descriptionText: tutor,
                  servicesText: "Home Tutoring",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "70",
                  price: "240",
                  descriptionText: roof,
                  offPrice: "800",
                  offColor: Colors.greenAccent,
                  img: roofImg,
                  servicesText: "Roof Cleaning",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "20",
                  price: "2400",
                  offPrice: "3000",
                  offColor: Colors.blueAccent,
                  img: eventImg,
                  descriptionText: event,
                  servicesText: "Event Planning",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "40",
                  price: "420",
                  offPrice: "700",
                  offColor: Colors.orangeAccent,
                  img: childImg,
                  descriptionText: childcare,
                  servicesText: "Child Care",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
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
              SizedBox(
                width: defaultSize - 20,
              ),
              PopularWidget(
                  width: width / 2.5,
                  height: 200.0,
                  off: "40",
                  price: "1200",
                  offPrice: "2000",
                  offColor: Colors.orangeAccent,
                  img: carpenterImg,
                  descriptionText: carpenter,
                  servicesText: "Carpenter",
                  fontSize: 18.0,
                  imageHeight: 115.0),
              SizedBox(
                width: defaultSize - 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
