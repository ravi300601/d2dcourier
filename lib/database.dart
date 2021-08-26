import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

Future<void> userSetup(String fName, String lName,String Phone,String Email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'Name': fName+" "+lName, 'Phone no': Phone, 'Email': Email, 'uid': uid});
  return;
}

Future<User> Loginuser(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    User user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;

    if(user != null){
      print("Login Successfull");
      return user;
    }else{
      print("Login failed");
      return user;
    }
  }catch (e){
    print(e);
    return null;
  }
}

Future logout(BuildContext context) async{
  FirebaseAuth auth = FirebaseAuth.instance;

  try{
    await auth.signOut().then((value){
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    });
  }catch(e){
    print("Error");
  }
}