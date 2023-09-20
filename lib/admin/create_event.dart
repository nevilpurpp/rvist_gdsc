import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rvist_gdsc/admin/event_form.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
File? image;
final TextEditingController title = TextEditingController();
final TextEditingController description = TextEditingController();
final TextEditingController highlights = TextEditingController();
DateTime now = DateTime.now();
// pick date function
void _showDatePicker(BuildContext context){
  showDatePicker(context: context,
   initialDate:DateTime.now(),
    firstDate:DateTime(2000,1,1,0,0), 
    lastDate: DateTime(2030,1,1,0,0)).then((value) {
      if (value != null) {
      setState(() {
        now = value;
      });
}});
}
//pick image 
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

showFormDialogOngoing(BuildContext context){
      return showDialog(context: context, 
    builder: (BuildContext context) {
      return  AlertDialog(
        title: Text('New Events'),
        content: SingleChildScrollView(
          child: Column(
       children: [
        //title
              TextFormField(
                controller: title,
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
                controller: description,
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
                controller: highlights,
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
             OutlinedButton(onPressed: (){
              _showDatePicker(context);
             }, child: const Text('Choose Date')),
             const SizedBox(height: 10,),
              //image 
              OutlinedButton(onPressed: (){
                pickImage();
              }, child: const Row(
                children: [

                   Text('Enter image'),
                  Spacer(),
                  Icon(Icons.add, color: Colors.white,)
                ],
              )),
              const SizedBox(height: 10,),
              //submit
             ElevatedButton(onPressed: (){
              addToFirestore();
             }, child: const Text('Submit'))
            ],
            
    )
  
        ),
      );
    });
}
showFormDialogImportant(BuildContext context){
      return showDialog(context: context, 
    builder: (BuildContext context) {
      return  AlertDialog(
        title: Text('New Events'),
        content: SingleChildScrollView(
          child: Column(
       children: [
        //title
              TextFormField(
                controller: title,
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
                controller: description,
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
                controller: highlights,
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
             OutlinedButton(onPressed: (){
              _showDatePicker(context);
             }, child: const Text('Choose Date')),
             const SizedBox(height: 10,),
              //image 
              OutlinedButton(onPressed: (){
                pickImage();
              }, child: const Row(
                children: [

                   Text('Enter image'),
                  Spacer(),
                  Icon(Icons.add, color: Colors.white,)
                ],
              )),
              const SizedBox(height: 10,),
              //submit
             ElevatedButton(onPressed: (){
              addToFirestoreImportant(); 
             }, child: const Text('Submit'))
            ],
            
    )
  
        ),
      );
    });
}
showFormDialogUpcoming(BuildContext context){
      return showDialog(context: context, 
    builder: (BuildContext context) {
      return  AlertDialog(
        title: Text('New Events'),
        content: SingleChildScrollView(
          child: Column(
       children: [
        //title
              TextFormField(
                controller: title,
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
                controller: description,
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
                controller: highlights,
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
             OutlinedButton(onPressed: (){
              _showDatePicker(context);
             }, child: const Text('Choose Date')),
             const SizedBox(height: 10,),
              //image 
              OutlinedButton(onPressed: (){
                pickImage();
              }, child: const Row(
                children: [

                   Text('Enter image'),
                  Spacer(),
                  Icon(Icons.add, color: Colors.white,)
                ],
              )),
              const SizedBox(height: 10,),
              //submit
             ElevatedButton(onPressed: (){
              addToFirestoreUpcoming();
             }, child: const Text('Submit'))
            ],
            
    )
  
        ),
      );
    });
}
Future addToFirestoreUpcoming() async{
  var imageName = DateTime.now().millisecondsSinceEpoch.toString();
  var storageRef = FirebaseStorage.instance.ref().child('event/$imageName.*');
  var uploadTask = storageRef.putFile(image!);
  var downloadUrl = await (await uploadTask).ref.getDownloadURL();
  
  FirebaseFirestore.instance.collection("events").doc('Upcoming Events').collection('upcoming').doc().set({
   "title": title.text,
    "description": description.text,
    "highlights": highlights.text,
    "date": now,                                   // Add image reference to document
   "image": downloadUrl.toString() 
     });
    Navigator.of(context).pop();
     title.clear();
    description.clear();
    highlights.clear();
}
Future addToFirestoreImportant() async{
  var imageName = DateTime.now().millisecondsSinceEpoch.toString();
  var storageRef = FirebaseStorage.instance.ref().child('event/$imageName.*');
  var uploadTask = storageRef.putFile(image!);
  var downloadUrl = await (await uploadTask).ref.getDownloadURL();
  
  FirebaseFirestore.instance.collection("events").doc('Important Event').set({
   "title": title.text,
    "description": description.text,
    "highlights": highlights.text,
    "date": now,
                                  
                                   // Add image reference to document
   "image": downloadUrl.toString() 
     });
    Navigator.of(context).pop();
     title.clear();
    description.clear();
    highlights.clear();
}
 Future addToFirestore() async{
  var imageName = DateTime.now().millisecondsSinceEpoch.toString();
  var storageRef = FirebaseStorage.instance.ref().child('event/$imageName.*');
  var uploadTask = storageRef.putFile(image!);
  var downloadUrl = await (await uploadTask).ref.getDownloadURL();
  
  FirebaseFirestore.instance.collection("events").doc('Ongoing Event').set({
   "title": title.text,
    "description": description.text,
    "highlights": highlights.text,
    "date": now,
                                  
                                   // Add image reference to document
   "image": downloadUrl.toString() 
     });
    Navigator.of(context).pop();
     title.clear();
    description.clear();
    highlights.clear();
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
              showFormDialogUpcoming(context,);
            },
            )
          ],           
          ),
        ExpansionTile(title: Text('Ongoing Event'),
             children: [
             GestureDetector(child: const ListTile(title: Text('new'),),
            onTap: (){
              showFormDialogOngoing(context);
            },
            )
          ], 
          ),
        
           ExpansionTile(title: Text('Important Event'),
                       children: [
             GestureDetector(child: const ListTile(title: Text('new'),),
            onTap: (){
             showFormDialogImportant(context);
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