import 'package:MemeApplicationFirebaseHackathon/backend/AppColors.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/Auth.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/memeList.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/models/meme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../firebase.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _MyHomePageState();
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Meme>>.value(
        value: Database().memes,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meme The Web.com"),
            backgroundColor: redColor,
            actions: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // put elements here
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding (
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RaisedButton(
                        color: Colors.black,
                        child: Text('Logout', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          AuthService().SignOut().then((value) {
                          Navigator.pop(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return HomePage();
                            },
                          ));
                          });
                        })
                      )
                    )
                  ]
                ),
              ),
            ],
          ),
          body: memeList(),
        ));
  }
}
