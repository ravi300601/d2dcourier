import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d2dcourier/Booking.dart';
import 'package:d2dcourier/ProfilePage.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'Login.dart';

String order_id; // to store order id in variable

// to get Current user unique id
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

// Fetch User Data from FireStore
Future getCurrentUserData() async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    DocumentSnapshot ds =
        await users.doc(uid).get(); //path of database in firestore
    String Name = ds.get('Name');
    String email = ds.get('Email');
    String phone_no = ds.get('Phone no');
    return [Name, email, phone_no];
  } catch (e) {
    print(e.toString());
    return null;
  }
}

// Add Courier data to Firestore
Future<void> userBooking(
    String Paddress,
    String daddress,
    int btype,
    String length,
    String width,
    String height,
    String weight,
    String cdetails) async {
  String type;
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  final String formattedDateTime =
      DateFormat('dd-MM-yyyy kk:mm:ss').format(DateTime.now()).toString();
  order_id = formattedDateTime;
  final String orderid =
      DateFormat('kkmmssddMMyyyy').format(DateTime.now()).toString();
  if (btype == 0) {
    type = 'Envelop';
  }
  if (btype == 1) {
    type = 'Box Pack';
  }
  if (btype == 2) {
    type = 'Other';
  }
  users.doc(uid).collection('Booking').doc(formattedDateTime).set({
    'Pick-up': Paddress,
    'drop': daddress,
    'type': type,
    'length': length,
    'width': width,
    'height': height,
    'weight': weight,
    'details': cdetails,
    'Date': formattedDateTime,
    'Order Id': orderid,
    'Status': "Pending",
    'Payment': "none",
    'Delivery_type': "normal",
    'Amount': '0'
  });
  return;
}

// Fetch booking detail from firestore
Future getBookinfList() async {
  List itemsList = [];

  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    CollectionReference Bookinglist = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Booking');
    await Bookinglist.get().then((value) {
      value.docs.forEach((element) {
        itemsList.add(element.data());
      });
    });
    return itemsList;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future updateUserList(String payment, String amount, String delivery) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  return await users.doc(uid).collection('Booking').doc(order_id).update(
      {'Delivery_type': delivery, 'Payment': payment, 'Amount': amount});
}
