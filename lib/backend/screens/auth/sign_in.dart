import 'package:MemeApplicationFirebaseHackathon/backend/Toast.dart';
import '../../Home.dart';
import '../../Toast.dart';

import '../../Auth.dart';
import 'package:flutter/material.dart';
import '../../AppColors.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

String UserEmail = "";
String UserPassword = "";

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final UsernameController = TextEditingController();
  final PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: redColor,
        elevation: 0.0,
        title: Text('Sign in to Meme The Web or Visit memetheweb.com'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 600.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            controller: UsernameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 600.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),
            controller: PasswordController,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
          child: RaisedButton(
            child: Text('Sign in'),
            onPressed: () async {
              if (UsernameController.text.length < 2 ||
                  PasswordController.text.length < 2) {
                showError(context, "Please Enter a Username or Password");
                return;
              }

              dynamic result = await _auth.SignIn(
                  UsernameController.text, PasswordController.text);
              if (result == null) {
                showError(context, 'Error signing in');
              } else {
                showInfo(context, 'Signed In');

                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return HomePage();
                    // return Scaffold(
                    //   appBar: AppBar(title: Text('My Page')),
                    //   body: Center(
                    //     child: FlatButton(
                    //       child: Text('POP'),
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //     ),
                    //   ),
                    // );
                  },
                ));

                print(result.uid);
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
          child: RaisedButton(
            child: Text('or Sign up'),
            onPressed: () async {
              if (UsernameController.text.length < 2 ||
                  PasswordController.text.length < 2) {
                showError(context, "Please Enter a Username or Password");
                return;
              }

              dynamic result = await _auth.SignUp(
                  UsernameController.text, PasswordController.text);

              if (result == null) {
                showError(context, 'Error signing up');
              } else {
                showInfo(context, 'Signed Up');

                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: Text('My Page')),
                      body: Center(
                        child: FlatButton(
                          child: Text('POP'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                ));

                print(result.uid);
              }
            },
          ),
        ),
      ])),
    );
  }
}
