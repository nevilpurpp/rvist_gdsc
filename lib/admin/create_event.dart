import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rvist_gdsc/admin/event_form.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
 final ImagePicker picker = ImagePicker();

showFormDialog(BuildContext context){
      return showDialog(context: context, 
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('New Events'),
        content: SingleChildScrollView(
          child: EventForm(),
        ),
      );
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Add Event'),
     ),
     body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        
        children:  [
          
       ExpansionTile(title: Text('Upcoming Event'),
          children: [
            GestureDetector(child: ListTile(title: Text('new'),),
            onTap: (){
              showFormDialog(context);
            },
            )
          ],           
          ),
        ExpansionTile(title: Text('Ongoing Event'),
             children: [
             GestureDetector(child: const ListTile(title: Text('new'),),
            onTap: (){
              showFormDialog(context);
            },
            )
          ], 
          ),
        
           ExpansionTile(title: Text('Important Event'),
                       children: [
             GestureDetector(child: const ListTile(title: Text('new'),),
            onTap: (){
             showFormDialog(context);
            },
            )
          ], 
                   ),
           
        ],
      ),
     ),
    );
  }
}