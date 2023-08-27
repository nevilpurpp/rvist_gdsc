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
              eventDocs.map((doc) => Events.fromJson(doc.data())).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 32, 38, 38),
                  ),
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
