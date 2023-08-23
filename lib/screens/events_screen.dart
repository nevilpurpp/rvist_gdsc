import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/upcoming_event.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});
 
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
              child: Column(
                children: [
                  EventAppBar(),
                  SizedBox(
                    height: 150,
                    child: UpcomingEvents()),
                ],
              ),
            
      )
    );
  }
}

