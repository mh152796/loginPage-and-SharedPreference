import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPageState(),
    );
  }
}

class SplashPageState extends StatefulWidget {
  @override
  State<SplashPageState> createState() => SplashPageStateState();
}

class SplashPageStateState extends State<SplashPageState> {

  static const String keyLogin = 'login';

  @override
  void initState() {
  print("hello");
    whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Icon(Icons.home),
        ),
      ),
    );
  }

  void whereToGo() async{
    var sharedPre = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPre.getBool(keyLogin);
    Timer(Duration(seconds: 2), () {
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }
    });

  }
}


