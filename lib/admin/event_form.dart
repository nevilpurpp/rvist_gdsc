import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
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
// send to firestore
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
                                   "Image": downloadUrl.toString() 
                                 });
                                 Navigator.of(context).pop();
                                 title.clear();
                                 description.clear();
                                 highlights.clear();
}
  @override
  Widget build(BuildContext context) {
    return Column(
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
            
    );
  }
}