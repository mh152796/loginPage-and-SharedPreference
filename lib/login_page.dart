import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cNameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(21.0),
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue,
              ),
            ),
            TextField(
              controller: cNameController,
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            ElevatedButton(onPressed: () async{
              var loginKey =SplashPageStateState.keyLogin;
              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(loginKey, true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
