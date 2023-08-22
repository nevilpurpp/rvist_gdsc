import 'package:cloud_firestore/cloud_firestore.dart';

class Events{
  final String title;
  final String  description;
  final String image;
  final DateTime date;
  final String id;

  Events({
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required  this.id
  });

  Map<String, Object?> toJson(){
    return {
      'title': title,
      'description': description,
      'image': image,
      'date': date,
      'id':id
    };
  }

   static Events fromJson(Map<String, dynamic> map) {
    return Events(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      date: (map['date'] as Timestamp).toDate(),
      id: map['id'] != null ? map['id'] as String : '',
    );
}
}