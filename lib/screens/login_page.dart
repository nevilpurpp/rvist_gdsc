import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../firebase/auth.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthMethods _authMethods = AuthMethods();
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SignInButton(
              Buttons.Google,
              onPressed: () async {
                bool result = await _authMethods.signInWithGoogle();
                if (result) {
                  Navigator.of(context).pushNamed(HomePage.id);
                }
              },
            )),
      ),
    );
  }
}
