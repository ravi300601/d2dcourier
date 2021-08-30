import 'dart:async';

import 'package:d2dcourier/Animation/FadeAnimation.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  1.0,
                  Container(
                    height: 350,
                    child: Center(
                      child: Text(
                        'An email has been sent to ${user.email}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                  1.0,
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(255, 140, 0, .8),
                          Color.fromRGBO(255, 165, 0, .6),
                        ])),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          "Send Again",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: (){
                            user.sendEmailVerification();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => dashboard()));
    }
  }
}
