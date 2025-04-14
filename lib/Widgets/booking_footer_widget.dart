import 'dart:developer';
import 'package:Door2Door_Services/Constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  var selectedDate = Rx<DateTime?>(null);
  var selectedTime = Rx<TimeOfDay?>(null);
  var addressController = TextEditingController().obs;

  void clearBookingFields() {
    selectedDate.value = null;
    selectedTime.value = null;
    addressController.value.clear();
  }
}

class BookingFooterWidget extends StatelessWidget {
  final bool isDarkMode;
  final String image;
  final String professionalName;

  const BookingFooterWidget({
    super.key,
    required this.isDarkMode,
    required this.image,
    required this.professionalName,
  });

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.put(BookingController());

    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0, left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () => _showBookingBottomSheet(context, controller),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? primaryColor : secondaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Book Now".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('This feature is not available yet!'),
                  backgroundColor: isDarkMode ? secondaryColor : secondaryColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? primaryColor : secondaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Contact".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingBottomSheet(BuildContext context, BookingController controller) {
    showModalBottomSheet(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Schedule Your Booking',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(context, controller),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: isDarkMode ? primaryColor : secondaryColor),
                      SizedBox(width: 10),
                      Obx(() => Text(
                        controller.selectedDate.value == null
                            ? 'Select Date'
                            : DateFormat('MMMM dd, yyyy \'at\'').format(controller.selectedDate.value!),
                        style: TextStyle(fontSize: 16),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectTime(context, controller),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: isDarkMode ? primaryColor : secondaryColor),
                      SizedBox(width: 10),
                      Obx(() => Text(
                        controller.selectedTime.value == null
                            ? 'Select Time'
                            : controller.selectedTime.value!.format(context),
                        style: TextStyle(fontSize: 16),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.addressController.value,
                  decoration: InputDecoration(
                    labelText: 'Enter your Address',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : secondaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    if (controller.selectedDate.value == null || controller.selectedTime.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select date and time!')),
                      );
                      return;
                    }

                    if (controller.addressController.value.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your address!')),
                      );
                      return;
                    }

                    try {
                      await _saveBookingToFirebase(controller);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to save booking!')),
                      );
                    }
                  },
                  label: Text(
                    'Confirm Booking'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, BookingController controller) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ) ?? DateTime.now();

    if (picked != controller.selectedDate.value) {
      controller.selectedDate.value = picked;
    }
  }

  Future<void> _selectTime(BuildContext context, BookingController controller) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: controller.selectedTime.value ?? TimeOfDay.now(),
    ) ?? TimeOfDay.now();

    if (picked != controller.selectedTime.value) {
      controller.selectedTime.value = picked;
    }
  }

  Future<void> _saveBookingToFirebase(BookingController controller) async {
    if (controller.selectedDate.value != null && controller.selectedTime.value != null && controller.addressController.value.text.isNotEmpty) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection('bookings').add({
        'date': DateFormat('MMMM dd, yyyy \'at \'').format(controller.selectedDate.value!),
        'time': controller.selectedTime.value!.format(Get.context!),
        'address': controller.addressController.value.text,
        'image': image,
        'professional_name': professionalName,
        'created_at': FieldValue.serverTimestamp(),
      }).then((value) {
        log('Booking added successfully');
        Get.back();
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Booking Confirmation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? primaryColor : secondaryColor,
                  ),
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Your booking is scheduled for ${DateFormat('MMMM dd, yyyy').format(controller.selectedDate.value!)} at ${controller.selectedTime.value!.format(Get.context!)}.\n\nAddress: ${controller.addressController.value.text}\n\nOur Professional Will Visit You Soon.\nThanks for using our platform.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isDarkMode ? primaryColor : secondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      controller.clearBookingFields();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );

      }).catchError((error) {
        log('Failed to add booking: $error');
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Failed to add booking')),
        );
      });
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Please fill all fields!')),
      );
    }
  }
}
