import 'package:MemeApplicationFirebaseHackathon/backend/Auth.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/models/user.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Make By DevSamuelV On Github
// This App is made for Flutterthon a Hackathon on PixelogicDev on

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}