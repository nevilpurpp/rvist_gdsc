import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Add Event'),
     ),
     body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: const [
          ExpansionTile(title: Text('Upcoming Event'),
          
          trailing: ListTile(
            leading: Icon(Icons.add_box_rounded),
            title: Text('New'),
          ),),
               ExpansionTile(title: Text('Ongoing Event'),
          
          trailing: ListTile(
            leading: Icon(Icons.add_box_rounded),
            title: Text('New'),
          ),),
               ExpansionTile(title: Text('Important Event'),
          
          trailing: ListTile(
            leading: Icon(Icons.add_box_rounded),
            title: Text('New'),
          ),)
        ],
      ),
     ),
    );
  }
}