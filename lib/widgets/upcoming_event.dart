import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({super.key});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .doc('Upcoming Events')
            .collection('upcoming')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final eventDocs = snapshot.data!.docs;
          final events =
              eventDocs.map((doc) => Events.fromJson(doc.data() as Map<String, dynamic>)).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return SizedBox(
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.memory(base64Decode(event.image.split(',').last)),
                      ),
                      Text(event.title),
                      Text(event.description)
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
