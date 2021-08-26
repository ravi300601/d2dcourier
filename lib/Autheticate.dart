import 'package:d2dcourier/Login.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Autheticate extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(auth.currentUser != null){
      return dashboard();
    }else{
      return Login();
    }
  }
}
