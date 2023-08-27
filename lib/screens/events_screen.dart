import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/ongoing_event.dart';
import '../widgets/upcoming_event.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});
 
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:  Image.asset('assets/logos/Google_for_Developers_logomark_color.png',),
        title: const Text('GDSC-RVIST',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
      ),

      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
              child: Column(
                children: [
                  OngoingEvent(),
                  Row(
                    children: [
                      
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Upcoming Events',style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.white70,),),
            ),
            Spacer(),
            
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: UpcomingEvents()),
                ],
              ),
            
      )
    );
  }
}

