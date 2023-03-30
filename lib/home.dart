import 'package:flutter/material.dart';
import 'package:shared_pre_login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('Home'),),
        actions: [
          TextButton(onPressed: () async{
            var loginKey =SplashPageStateState.keyLogin;
            var sharedPref = await SharedPreferences.getInstance();
            sharedPref.setBool(loginKey, false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
          }, child: Text('Logout'))
        ],
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Icon(Icons.home, color: Colors.white.withOpacity(0.7)),
        ),
      ),
    );
  }
}
