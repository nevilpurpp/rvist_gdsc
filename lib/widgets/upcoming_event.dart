import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../screens/event_detail_screen.dart';

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
                padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                child: GestureDetector(
                  onTap: () {
                      Navigator.of(context).push(
                 MaterialPageRoute(
                builder: (context) => EventDetailScreen(event: event),
                 ),
                               );
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 32, 38, 38),
                    ),
                    child: Column(
                     // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child:Image(image: NetworkImage(event.image),
                            fit: BoxFit.cover,
                            ))
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0), 
                          child: Column(
                            children: [

                              Text(event.title, style: const TextStyle(fontSize: 20),),
                               Text(event.description,
                               overflow: TextOverflow.ellipsis,
                               maxLines: 2,
                                style: TextStyle(color: Colors.grey[700]),)
                            ],
                          ),
                        ),
                      //date
                        Expanded(
                         child:  Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.0),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              //Text(event.date as String),
                             const Icon(Icons.calendar_month),
                             Text(event.date.toString()),
                            ]
                          ),
                                             ),
                       )
                      ],
                    ),
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
