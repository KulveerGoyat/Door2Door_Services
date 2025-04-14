import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString name = ''.obs;
  RxString email = ''.obs;

  Future<void> fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot docSnapshot = await firestore.collection('users').doc(currentUser.uid).get();
        if (docSnapshot.exists) {
          Map<String, dynamic> userData = docSnapshot.data() as Map<String, dynamic>;
          name.value = userData['name'] ?? '';
          email.value = userData['email'] ?? '';
        } else {
          name.value = 'No name available';
          email.value = 'No email available';
        }
      } catch (e) {
       log("Error fetching user data: $e");
        name.value = 'Error';
        email.value = 'Error';
      }
    } else {
      log("No user is logged in");
    }
  }
}
