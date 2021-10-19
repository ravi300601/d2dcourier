import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d2dcourier/ProfilePage.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'Login.dart';

// FirebaseAuth auth = FirebaseAuth.instance;
// final String uid = auth.currentUser.uid.toString();

// CollectionReference usersCollection =
//     FirebaseFirestore.instance.collection('Users');
// FirebaseAuth auth = FirebaseAuth.instance;
// String uid = auth.currentUser.uid.toString();

Future<String> getCurrentUID() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  return uid;
}

CollectionReference users = FirebaseFirestore.instance.collection('Users');

// Add data in firebase
Future<void> userSetup(
    String fName, String lName, String Phone, String Email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.doc(uid).set({
    'Name': fName + " " + lName,
    'Phone no': Phone,
    'Email': Email,
    'uid': uid
  });
  return;
}

// User Login Function
Future<User> Loginuser(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User user = (await auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Login Successfull");
      return user;
    } else {
      print("Login failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

// User Logout function
Future logout(BuildContext context) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    });
  } catch (e) {
    print("Error");
  }
}

Stream<QuerySnapshot> get cusers {
  return users.snapshots();
}

Future getCurrentUserData() async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentSnapshot ds = await users.doc(uid).get();
    String Name = ds.get('Name');
    String email = ds.get('Email');
    String phone_no = ds.get('Phone no');
    return [Name, email, phone_no];
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<void> userBooking(
    String Paddress,
    String daddress,
    int type,
    String length,
    String width,
    String height,
    String weight,
    String cdetails) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  final String formattedDateTime =
      DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()).toString();
  users.doc(uid).collection('Booking').doc(formattedDateTime).set({
    'Pick-up': Paddress,
    'drop': daddress,
    'type': type,
    'length': length,
    'width': width,
    'height': height,
    'weight': weight,
    'details': cdetails
  });
  return;
}
