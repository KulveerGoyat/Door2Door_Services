
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouritesController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addToFavourites({
    required String professionalName,
    required String image,
    required String rating,
    required int noOfRatings,
    required String experience,
    required String timeAvailability,
    required String location,
  }) async {
    try {
      await firestore.collection('favourites').add({
        'professional_name': professionalName,
        'image': image,
        'rating': rating,
        'no_of_ratings': noOfRatings,
        'experience': experience,
        'time_availability': timeAvailability,
        'location': location,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Added to favourites successfully.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Failed to add to favourites.')),
      );
    }
  }
}
