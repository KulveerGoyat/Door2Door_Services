import 'package:Door2Door_Services/Database/firebase_services.dart';
import 'package:flutter/material.dart';


class EmailVerificationController extends StatefulWidget {
  final auth = AuthService();
  bool isResendAllowed = true;

  EmailVerificationController({super.key});


  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  Future<void> sendVerification(String email, BuildContext context) async {
    await auth.emailVerification(email, context);
  }

  void resendVerificationEmail(String email, BuildContext context) {
    if (!isResendAllowed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Please wait before resending the verification email.")),
      );
      return;
    }
    isResendAllowed = false;
    sendVerification(email, context);
    Future.delayed(Duration(seconds: 30), () {
      isResendAllowed = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You can now resend the verification email.")),
      );
    });
  }

  void setTimerForAutoRedirect() {}

  void manuallyCheckEmailVerificationStatus() {}

}
