import 'package:Door2Door_Services/Constants/image_strings.dart';
import 'package:Door2Door_Services/Database/firebase_services.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/login.dart';
import 'package:Door2Door_Services/Widgets/button_loading_widget.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/text_strings.dart';


class SignUpFooterWidget extends StatefulWidget {
  const SignUpFooterWidget({super.key});

@override
_SignUpFooterWidgetState createState() => _SignUpFooterWidgetState();
}


class _SignUpFooterWidgetState extends State<SignUpFooterWidget> {
  final auth = AuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async{
              try{
                setState(() {
                  isLoading = true;
                });
             await auth.signInWithGoogle(context);
                setState(() {
                  isLoading = false;
                });
              }catch(e){
                setState(() {
                  isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed.")));
              }
            },
            icon: isLoading? const SizedBox() : Image(
              image: AssetImage(googleImg),
              width: 20.0,
            ),
            label: isLoading? const ButtonLoadingWidget() : Text(signInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: alreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextSpan(
                text: login.toUpperCase(),
                style: TextStyle(
                  color: isDarkMode? Colors.blue : secondaryColor,
                  fontWeight: FontWeight.w600,
                ))
          ])),
        )
      ],
    );
  }

}
