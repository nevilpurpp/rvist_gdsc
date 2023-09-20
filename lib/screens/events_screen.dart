import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../admin/create_event.dart';
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
      
        title: Row(
          children: [
            Image.asset('assets/logos/Google_for_Developers_logomark_color.png',),
            const Text('GDSC-RVIST',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      drawer:  Drawer(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
         children: [
GestureDetector(
  child:   ListTile(
  
    leading: Icon(Icons.event_available_outlined),
  
    title: Text('Event'),
  
  ),
  onTap: (){              Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateEvent()),
      );
  },
)
         ],
        )
      ),
      ),

      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: OngoingEvent()),
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
                    child: UpcomingEvents()
                    ),
                ],
              ),
            
      )
    );
  }
}

