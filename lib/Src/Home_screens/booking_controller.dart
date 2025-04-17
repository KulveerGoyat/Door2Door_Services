import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingController extends GetxController {
  var selectedDate = Rx<DateTime?>(null);
  var selectedTime = Rx<TimeOfDay?>(null);
  var addressController = TextEditingController().obs;
  var bookings = RxList<Map<String, dynamic>>([]);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void setSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  void clearBookingFields() {
    selectedDate.value = null;
    selectedTime.value = null;
    addressController.value.clear();
  }

  Future<void> fetchBookings() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('bookings').get();
      List<Map<String, dynamic>> fetchedBookings = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'date': doc['date'],
          'time': doc['time'],
          'address': doc['address'],
          'image': doc['image'],
          'professional_name': doc['professional_name'],
        };
      }).toList();
      bookings.value = fetchedBookings;  // Update the bookings list
    } catch (e) {
      log('Error fetching bookings: $e');
    }
  }

  Future<void> deleteBooking(String id) async {
    await FirebaseFirestore.instance.collection('bookings').doc(id).delete();
    fetchBookings();
  }
}


