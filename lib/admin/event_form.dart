import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}
 final ImagePicker _picker = ImagePicker();

class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
        //title
              TextFormField(),
              //description
              TextFormField(),
              //Highlights
              TextFormField(),
              //date
              DateTimePicker(),
              //image 
              OutlinedButton(onPressed: (){}, child: Text('enter image')),
              //submit
             ElevatedButton(onPressed: (){}, child: Text('Submit'))
            ],
    );
  }
}