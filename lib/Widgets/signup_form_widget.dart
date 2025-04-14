import 'dart:developer';

import 'package:Door2Door_Services/Src/Startup_screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Constants/size.dart';
import '../Constants/text_strings.dart';
import '../Database/firebase_services.dart';
import '../Src/LogIn_Signup_screens/login.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _auth = AuthService();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: formSize - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                  label: Text(fullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: formSize - 20),

            // Email Field
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  label: Text("Email"), prefixIcon: Icon(Icons.email_outlined)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: formSize - 20),

            TextFormField(
              controller: _phone,
              decoration: const InputDecoration(
                  label: Text(phoneNo), prefixIcon: Icon(Icons.numbers)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (value.length < 10) {
                  return 'Phone number must be at least 10 digits';
                }
                return null;
              },
            ),
            const SizedBox(height: formSize - 20),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text(password), prefixIcon: Icon(Icons.fingerprint)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: formSize - 10),
            TextFormField(
              controller: _confirmPassword,
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text("Confirm Password"), prefixIcon: Icon(Icons.lock)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: formSize - 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signup,
                child: Text(signUp.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _saveUserToFirestore(User user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('users').doc(user.uid).set({
        'name': _name.text.trim(),
        'email': _email.text.trim(),
        'phone': _phone.text.trim(),
        'password': _password.text.trim(),
        'created_at': FieldValue.serverTimestamp(),
      });
      log("User details saved successfully to Firestore");
    } catch (error) {
      log("Error saving user details to Firestore: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving user details: $error")),
      );
    }
  }

  void goToLogin(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );

  void goToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
  );

  _signup() async {
    if (_formKey.currentState?.validate() ?? false) {
      final user = await _auth.createUserWithEmailAndPassword(
        _email.text.trim().toLowerCase(),
        _password.text.trim(),
      );
      if (user != null) {
        log("User Created Successfully");
        await _saveUserToFirestore(user);
        goToHome(context);
      } else {
        log("Failed");
      }
    } else {
      log("Form is not valid");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix the errors in the form")),
      );
    }
  }
}


