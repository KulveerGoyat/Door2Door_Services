import 'dart:developer';
import 'package:Door2Door_Services/Src/home.dart';
import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import '../Constants/size.dart';
import '../Constants/text_strings.dart';
import '../Database/firebase_services.dart';
import '../Src/LogIn_Signup_screens/forget_password/forget_password_modelbottomsheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final width =  mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formSize - 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Email Field with validation
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: "Email",
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: formSize - 20.0,
            ),


            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(
              height: formSize - 25.0,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      buildShowModalBottomSheet(context, width);
                    },
                    child: Text(
                      forgetPassword,
                      style: TextStyle(
                        color: isDarkMode? Colors.blue : secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ))),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => _login(context), // Fixed here
                    child: Text(login.toUpperCase())))
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final user = await _auth.loginUserWithEmailAndPassword(
        _email.text.trim().toLowerCase(),
        _password.text.trim(),
      );

      if (user != null) {
        log("User Logged In");
        goToHome(context);
      } else {
        log("Login failed: User is null");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed")),
        );
      }
    } else {
      log("Form is not valid");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix the errors above")),
      );
    }
  }

  void goToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }}
