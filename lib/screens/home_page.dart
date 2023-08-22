import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rvist_gdsc/firebase/auth.dart';
import 'package:rvist_gdsc/screens/events_screen.dart';


import 'group_chat.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var _selectedTab = _SelectedTab.event;

void _handleIndexChanged(int i) {
  print('Selected tab index: $i');
  setState(() {
    _selectedTab = _SelectedTab.values[i];
  });
}



  @override
  Widget build(BuildContext context) {
      Widget selectedScreen;

    switch (_selectedTab) {
      case _SelectedTab.event:
        selectedScreen =  EventScreen();
        break;
      case _SelectedTab.group:
        selectedScreen = const GroupChatScreen();
        break;
      case _SelectedTab.person:
        selectedScreen = const ProfileScreen();
        break;
    }
    return  Scaffold(
      body: selectedScreen,
     bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon:const Icon(Icons.home),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: const Icon(Icons.chat_bubble_rounded),
              selectedColor: Color(0xff73544C),
            ),


            /// Profile
            DotNavigationBarItem(
              icon: const Icon(Icons.person),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),

   
    );
  }
}
enum _SelectedTab { event, group, person }