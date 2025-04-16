import 'dart:developer';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/forget_password/email_verffication.dart';
import 'package:Door2Door_Services/Src/LogIn_Signup_screens/forget_password/otp_screen.dart';
import 'package:Door2Door_Services/Src/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong during user creation");
      log("$e");
      return null;
    }
  }

  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong during login");
      log("$e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong during sign out");
    }
  }

  Future<void> phoneVerification(String phoneNumber, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: null,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Phone number verified successfully")));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification failed: $e")));
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification failed: ${e.message}")));
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OTPScreen(verificationID: verificationId)),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP auto-retrieval timeout")));
        },
      );
    } catch (e) {
      log("Something went wrong during phone verification");
      log("$e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong: $e")));
    }
  }

  Future<void> emailVerification(String email, BuildContext context) async {
    try {
      if (_auth.currentUser?.email == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user is logged in")));
        return;
      }
      if (_auth.currentUser?.email != email) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not found")));
        return;
      }

      await _auth.currentUser?.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification email sent to $email")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmailVerification(email: email)),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification failed: ${e.message}")));
    }
  }

  Future<bool> isEmailVerified() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.reload();
        return user.emailVerified;
      }
      return false;
    } catch (e) {
      log("Failed to check email verification status");
      log("$e");
      return false;
    }
  }

  Future<void> checkEmailVerificationStatus(BuildContext context) async {
    bool isVerified = await isEmailVerified();
    if (isVerified) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please verify your email")));
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw Exception('Google Sign-In failed: No user selected');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

      return userCredential;
    } catch (e) {
      log("Google Sign-In Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed: $e')),
      );
      rethrow;
    }
  }



}

