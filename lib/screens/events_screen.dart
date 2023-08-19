import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
children: [
  Row(
    children: [
      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      Spacer(),
      Card(child: Row(children: [
        Text(''),
        Image.network('')
      ]),)
    ]
  ),
  

],
        )

      ),
    );
  }
}