
import 'package:flutter/material.dart';

import '../Constants/text_strings.dart';

class BookingBodyWidget extends StatelessWidget {
  const BookingBodyWidget({
    super.key,
    required this.professionalName,
    required this.timeAvailability,
    required this.experience,
    required this.width,
    required this.location,
  });

  final String professionalName;
  final String timeAvailability;
  final String experience;
  final double width;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Professional Details : ",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Experience : $experience",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16.0,
            ),
          ), Row(
            children: [
              Text(
                "Location : ",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 16.0,
                ),
              ),
              Icon(Icons.location_pin, color: Colors.green),
              Text(
                location,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ],
          ), Row(
            children: [
              Text(
                "Timing : Available Till $timeAvailability PM",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(width: width * 0.02),
              Icon(Icons.access_time, color: Colors.green),
            ],
          ),    Text(
            language,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16.0,
            ),
          ),
          Text(
            serviceOfferedHeading,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            serviceOfferedSubHeading,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16.0,
            ),
          ),
          Text(
            "$whyChooseHeading $professionalName?",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            whyChooseSubHeading,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16.0,
            ),
          ),
          Text(
            bookAppointmentHeading,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            bookAppointmentSubHeading,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}