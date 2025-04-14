import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';
import '../Src/Home_screens/services.dart';

class ServicesContainerWidget extends StatelessWidget {
  const ServicesContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.servicesText,
    required this.descriptionText,
    required this.img,
    required this.fontSize,
    required this.imageHeight,
  });

  final double height;
  final String img;
  final String servicesText;
  final String descriptionText;
  final double width;
  final double fontSize;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    bool isSvg(String img) {
      return img.endsWith('.svg');
    }

    return InkWell(
      onTap:() {
        Get.to(() => ServicesScreen(
          servicesText: servicesText,
        servicesImg: img,
          descriptionText: descriptionText,
        ));
      },
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(10.0),
        color: isDarkMode? secondaryColor : containerBg,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? primaryColor : secondaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSvg(img))
                Image(image: Svg(img), height: imageHeight,)
              else
                Image(image: AssetImage(img), height: imageHeight,),
              SizedBox(height: 2.0,),
              Text(servicesText, style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ),
    );
  }
}