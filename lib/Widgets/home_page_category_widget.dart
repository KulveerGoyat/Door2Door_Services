
import 'package:Door2Door_Services/Widgets/services_container_widget.dart';
import 'package:flutter/material.dart';

import '../Constants/image_strings.dart';
import '../Constants/size.dart';
import '../Constants/text_strings.dart';
import '../Src/Home_screens/category_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
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
              "All Category",
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: SizedBox()),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen() ));
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: docImg, servicesText: "Doctor", fontSize: 8.0, imageHeight : 45.0 , descriptionText: doc,),
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: plumberImg, servicesText: "Plumber", fontSize: 8.0, imageHeight : 45.0,descriptionText:  plumber,),
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: cleanImg, servicesText: "Janitor", fontSize: 8.0, imageHeight : 45.0,descriptionText:  cleaning),
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: gardenImg, servicesText: "Gardener", fontSize: 8.0, imageHeight : 45.0, descriptionText: gardening,),
          ],
        ),
        SizedBox(height: defaultSize - 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: petCareImg, servicesText: "Pet Care", fontSize: 8.0, imageHeight : 45.0, descriptionText:  petCare,),
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: electricImg, servicesText: "Electrician", fontSize: 8.0, imageHeight : 45.0, descriptionText: electrician,),
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: acImg, servicesText: "Ac Services", fontSize: 8.0, imageHeight : 45.0, descriptionText: acRepair,),
            ServicesContainerWidget(width : width/5.5, height: 70.0, img: moveImg, servicesText: "Shifting", fontSize: 8.0, imageHeight : 45.0, descriptionText: moving,),
          ],
        ),
        SizedBox(height: defaultSize - 20.0,),

      ],
    );
  }
}
