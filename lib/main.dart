import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rvist_gdsc/screens/home_page.dart';
import 'package:rvist_gdsc/screens/login_page.dart';

import 'constants/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
