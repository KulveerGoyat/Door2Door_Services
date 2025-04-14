
import 'package:flutter/material.dart';

class ForgetPasswordBTNWidget extends StatelessWidget {
  const ForgetPasswordBTNWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.width,
    required this.onTap,

    super.key,
  });

  final IconData btnIcon;
  final String title , subTitle;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
           // color: isDarkMode ? secondaryColor : primaryColor,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isDarkMode ? Colors.grey.shade400 : Colors.black,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align the content vertically
            children: [
              Icon(btnIcon,
                size: 60.0, // This can be adjusted dynamically
                color: Colors.blue, // Icon color
              ),
              const SizedBox(width: 16.0), // Horizontal spacing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, // Make email text bold
                        fontSize: width > 600 ? 20.0 : 18.0, // Larger font for wider screens
                        color: isDarkMode ?  Colors.black : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4.0), // Adds spacing between lines
                    // Reset Description - Smaller and lighter text
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: width > 600 ? 18.0 : 16.0,
                        color: isDarkMode ?  Colors.black : Colors.grey[400],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          )

      ),
    );
  }
}