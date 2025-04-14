import 'package:Door2Door_Services/Constants/colors.dart';
import 'package:Door2Door_Services/Src/Home_screens/explore_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/favourites_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/profile_screen.dart';
import 'package:Door2Door_Services/Src/Home_screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    ExploreScreen(),
    CategoryScreen(),
    FavouritesScreen(),
    ProfileScreen(),
    Center(child: Text('About Page')),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: SingleChildScrollView(
        child: SalomonBottomBar(
          backgroundColor: isDarkMode ? primaryColor : Colors.black,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.explore_outlined,
                  color: isDarkMode ? secondaryColor : primaryColor,
                ),
                title: Text(
                  'Explore',
                  style: TextStyle(
                    color: isDarkMode ? secondaryColor : primaryColor,
                  ),
                )),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.category_rounded,
                  color: isDarkMode ? secondaryColor : primaryColor,
                ),
                title: Text(
                  'Category',
                  style: TextStyle(
                    color: isDarkMode ? secondaryColor : primaryColor,
                  ),
                )),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: isDarkMode ? secondaryColor : primaryColor,
                ),
                title: Text(
                  'Favourites',
                  style: TextStyle(
                    color: isDarkMode ? secondaryColor : primaryColor,
                  ),
                )),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.person,
                  color: isDarkMode ? secondaryColor : primaryColor,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: isDarkMode ? secondaryColor : primaryColor,
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
