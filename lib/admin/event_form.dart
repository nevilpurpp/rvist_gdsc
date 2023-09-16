
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

final ImagePicker _picker = ImagePicker();
final TextEditingController e_title = TextEditingController();
final TextEditingController e_description = TextEditingController();
final TextEditingController e_highlights = TextEditingController();
DateTime now = DateTime.now();

void _showDatePicker(BuildContext context){
  showDatePicker(context: context,
   initialDate:DateTime.now(),
    firstDate:DateTime(2000), 
    lastDate: DateTime(2030)).then((value) {
      if (value != null) {
      setState(() {
        now = value;
      });
}});
}
class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
        //title
              TextFormField(
                controller: e_title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Title' ,
                ),
              ),
              const SizedBox(height: 10,),
              //description
              TextFormField(
                controller: e_description,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Description' ,
                ),
              ),
              const SizedBox(height: 10,),
              //Highlights
              TextFormField(
                controller: e_highlights,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Highlights' ,
                ),
              ),
              const SizedBox(height: 10,),
              //date
             OutlinedButton(onPressed: (){}, child: Text('Choose Date')),
              //image 
              OutlinedButton(onPressed: (){}, child: const Row(
                children: [

                   Text('Enter image'),
                  Spacer(),
                  Icon(Icons.add, color: Colors.white,)
                ],
              )),
              const SizedBox(height: 10,),
             ElevatedButton(onPressed: (){}, child: const Text('Submit'))
            ],
              //submit
    );
  }
}