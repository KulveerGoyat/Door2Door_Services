import 'package:Door2Door_Services/Constants/image_strings.dart';
import 'package:Door2Door_Services/Model/model_on_boarding.dart';
import 'package:Door2Door_Services/Src/Startup_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Constants/colors.dart';
import '../../Constants/text_strings.dart';
import '../../Widgets/onboarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: onboardImg1,
          title: onboardTitle1,
          subTitle: onboardSubTitle1,
          counterText: onboardCounter1,
          bgColor: onboardColorPage1,
          size: size.height * 0.5,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: onboardImg2,
          title: onboardTitle2,
          subTitle: onboardSubTitle2,
          counterText: onboardCounter2,
          bgColor: onboardColorPage2,
          size: size.height * 0.5,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: onboardImg3,
          title: onboardTitle3,
          subTitle: onboardSubTitle3,
          counterText: onboardCounter3,
          bgColor: onboardColorPage3,
          size: size.height * 0.5,
        ),
      ),
    ];

    void onPageChangedCallback(int activePageIndex){
      setState(() {
        currentPage = activePageIndex;
      });
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(pages: pages,
            liquidController: controller,
            onPageChangeCallback: onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back, color: Colors.black),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(onPressed: (){
              if(currentPage != 2){
                int nextPage = controller.currentPage + 1 ;
                controller.animateToPage(page: nextPage);
              }else{
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );
              }
            },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.arrow_forward_ios , color: Colors.white,),
                )
            ),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const WelcomeScreen()),)
                  },
                  child: const Text("Skip", style: TextStyle(color: Colors.grey),)
              )
          ),
          Positioned(
              bottom: 15.0,
              child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                  dotWidth: 5.0,
                ),
              )
          )
        ],
      ),
    );
  }
}
