import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';

class OngoingEvent extends StatefulWidget {
  const OngoingEvent({super.key});

  @override
  State<OngoingEvent> createState() => _OngoingEventState();
}

class _OngoingEventState extends State<OngoingEvent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
  stream: FirebaseFirestore.instance
      .collection('events')
      .doc('Ongoing Event')
      .snapshots(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }

    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    if (!snapshot.hasData) {
      return Text('No data available');
    }

    final eventData = snapshot.data!.data();

    if (eventData == null) {
      return const Text('No event data available');
    }

    final event = Events.fromJson(eventData);

    return Container(
height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 32, 38, 38),
        borderRadius: BorderRadius.circular(20),
        
      ),
      
      child: Column(
        children: [
        Text(event.title),
        ],
      ),
    );
  })
    );
  }

  }
  