
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EventAppBar extends StatefulWidget {
  const EventAppBar({super.key});

  @override
  State<EventAppBar> createState() => _EventAppBarState();
}
GoogleSignInAccount? currentUser;


class _EventAppBarState extends State<EventAppBar> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row (children: [
            Image.asset('assets/logos/Google_for_Developers_logomark_color.png',
            height: 60,
            width: 60),
            Spacer(),
          ],),
          const Text('Google Developer Student Club',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          const Text('Rift Valley Institute of Science And Technology')
        ],
      ),
    );
  }
}