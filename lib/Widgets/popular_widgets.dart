import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import '../Constants/colors.dart';
import '../Src/Home_screens/services.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
    required this.width,
    required this.height,
    required this.servicesText,
    required this.descriptionText,
    required this.img,
    required this.fontSize,
    required this.imageHeight,
    required this.off,
    required this.offColor,
    required this.offPrice,
    required this.price,
  });

  final double height;
  final String img;
  final String servicesText;
  final String descriptionText;
  final double width;
  final double fontSize;
  final double imageHeight;
  final String off;
  final Color offColor;
  final String price;
  final String offPrice;

  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    bool isSvg(String img) {
      return img.endsWith('.svg');
    }

    return InkWell(
      splashColor: Colors.blueAccent,
      highlightColor: Colors.blue[100],
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
        color: isDarkMode ? secondaryColor : containerBg,
        child: Container(
          padding: EdgeInsets.all(8.0),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: offColor),
                      child: Text(
                        ("$off% OFF"),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(child: SizedBox()),
                  Column(
                    children: [
                      Text(
                        ("Rs.$offPrice"),
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        ),
                      ),Text(
                        ("\u20B9$price"),
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isSvg(img))
                    Image(
                      image: Svg(img),
                      height: imageHeight,
                    )
                  else
                    Image(
                      image: AssetImage(img),
                      height: imageHeight,
                    ),

                  Text(
                    servicesText,
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
