import 'package:firebase_core/firebase_core.dart';

import 'Screens/Home/HomeScreen.dart';
import 'Screens/Auth/Login.dart';
import 'Screens/Auth/SignUp.dart';
import 'Screens/Auth/Start.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          primaryColor: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

      routes: <String,WidgetBuilder> {
        "Login" : (BuildContext context) => Login(),
        "SignUp" : (BuildContext context) => SignUp(),
        "start" :  (BuildContext context) => Start(),
      },

    );
  }
}
