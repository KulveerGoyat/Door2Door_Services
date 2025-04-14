
import 'package:Door2Door_Services/Database/firebase_services.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/signup.dart';
import 'package:flutter/material.dart';
import '../Constants/image_strings.dart';
import '../Constants/size.dart';
import '../Constants/text_strings.dart';
import 'button_loading_widget.dart';

class LoginFooterWidget extends StatefulWidget {
  const LoginFooterWidget({super.key});

  @override
  LoginFooterWidgetState createState() => LoginFooterWidgetState();
}

class LoginFooterWidgetState extends State<LoginFooterWidget> {
  bool isLoading = false;
  final auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: formSize - 20,
        ),
        SizedBox(
          width: double.infinity,
          child:OutlinedButton.icon(
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
        const SizedBox(
          height: formSize - 20,
        ),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupPage()));
        }, child: Text.rich(TextSpan(
          text: dontHaveAnAccount, style: Theme.of(context).textTheme.bodyLarge,
          children: const [
            TextSpan(
              text: signUp, style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.blue,
    ),
            ),
          ],
        ))),
      ],
    );
  }
}
