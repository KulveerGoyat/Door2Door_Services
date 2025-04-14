
import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../Constants/image_strings.dart';
import '../../Constants/size.dart';
import '../../Constants/text_strings.dart';
import '../../Widgets/form_header_widget.dart';
import '../../Widgets/login_footer_widget.dart';
import '../../Widgets/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;



    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: isDarkMode ? secondaryColor : primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: isDarkMode ? Colors.white : secondaryColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(defaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  FormHeaderWidget(
                  image: workerImg,
                  title: loginTitle,
                  subTitle: loginSubTitle,
                  imageHeight: 0.15,
                ),
                    LoginForm(),
                   LoginFooterWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}