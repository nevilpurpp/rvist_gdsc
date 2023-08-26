import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;

  List<Widget> tabItems = [
   const EventScreen(),
   const GroupChatScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: Center(
          child: tabItems[_selectedIndex],
        ),
    bottomNavigationBar: FlashyTabBar(
     selectedIndex: _selectedIndex,
     showElevation: true,
     onItemSelected: (index) => setState(() {
       _selectedIndex = index;
     }),
     items: [
        FlashyTabBarItem(
          icon: const Icon(Icons.event),
            activeColor:const  Color.fromARGB(255, 115, 142, 142),
          inactiveColor: Colors.white,
          title: const Text('Events'),
        ),
        FlashyTabBarItem(
             activeColor: const Color.fromARGB(255, 115, 142, 142),
          inactiveColor: Colors.white,
          icon: const Icon(Icons.chat),
          title: const Text('Group'),
        ),
      
        FlashyTabBarItem(
          activeColor:  const  Color.fromARGB(255, 115, 142, 142),
          inactiveColor: Colors.white,
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
        ),
    
      ],
),

   
    );
  }
}
