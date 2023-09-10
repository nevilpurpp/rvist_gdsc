import 'package:flutter/material.dart';

import '../models/event_model.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key, required this.event});
 final Events event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(event.image), // Display event image
            Text(event.title), // Display event title
            Text(event.description), // Display event description
            Text(event.date.toString()), // Display event date
            // Add more widgets to display other event details
          ],
        ),
      ),
    );
  }
}