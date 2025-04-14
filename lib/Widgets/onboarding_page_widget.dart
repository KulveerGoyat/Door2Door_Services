import 'package:flutter/material.dart';
import '../Constants/size.dart';
import '../Model/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.bgColor,
      padding: EdgeInsets.symmetric(horizontal: defaultSize, vertical: defaultSize * 1.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(model.image), height: model.size * 0.4),
          SizedBox(height: model.size * 0.05),
          Column(
            children: [
              Text(
               model.title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: model.size * 0.02),
              Text(
                model.subTitle,
                style: TextStyle(
                  fontSize: model.size * 0.05,
                  color: Colors.black.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: model.size * 0.05),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: model.size * 0.06,
              color: Colors.black.withValues(alpha:0.8),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
