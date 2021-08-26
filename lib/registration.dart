import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/database.dart';
import 'package:d2dcourier/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/FadeAnimation.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Loader.dart';
import 'Login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: register(),
    ));

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final Email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final fName = TextEditingController();
  final lName = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void validate() {
    if (_formKey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validate");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: Loader())
          : SingleChildScrollView(
              child: Container(
                  child: Column(
              children: <Widget>[
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Images/background1.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 18,
                        width: 70,
                        height: 285,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Images/image.png'))),
                            )),
                      ),
                      Positioned(
                        right: 20,
                        top: 30,
                        width: 50,
                        height: 120,
                        child: FadeAnimation(
                            1.2,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        height: 200,
                        right: 120,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Center(
                                child: Text(
                                  "Registration",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.5,
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .3),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        validator: RequiredValidator(
                                            errorText:
                                                "First Name is Mandatory"),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "First Name",
                                            hintStyle: TextStyle(
                                                color: Colors.black54)),
                                        controller: fName,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        validator: RequiredValidator(
                                            errorText:
                                                "Last Name is Mandatory"),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Last Name",
                                            hintStyle: TextStyle(
                                                color: Colors.black54)),
                                        controller: lName,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        validator: RequiredValidator(
                                            errorText: "Phone No. is Mandatory"),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Phone No.",
                                            hintStyle: TextStyle(
                                                color: Colors.black54)),
                                        controller: phoneNo,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "Email is Mandatory"),
                                          EmailValidator(
                                              errorText: "Not A Valid Email"),
                                        ]),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                color: Colors.black54)),
                                        controller: Email,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        obscureText: true,
                                        validator: RequiredValidator(
                                            errorText: "Password is Mandatory"),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.black54)),
                                        controller: password,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: size.height / 25,
                          ),
                          FadeAnimation(
                              1.6,
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
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onPressed: () async {
                                      validate();
                                      if (fName.text != "" ||
                                          lName.text != "" ||
                                          phoneNo.text != "" ||
                                          Email.text != "" ||
                                          password.text != "") {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        try {
                                          await Firebase.initializeApp();
                                          UserCredential user = await FirebaseAuth
                                              .instance
                                              .createUserWithEmailAndPassword(
                                            email: Email.text,
                                            password: password.text,
                                          );
                                          User updateUser =
                                              FirebaseAuth.instance.currentUser;
                                          updateUser.updateProfile(
                                              displayName: fName.text);
                                          userSetup(fName.text, lName.text,
                                              phoneNo.text, Email.text);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      dashboard()));
                                          setState(() {
                                            isLoading = false;
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'weak-password') {
                                            Fluttertoast.showToast(msg: e.code);
                                            print('The Password provided is too weak.');
                                            setState(() {
                                              isLoading = false;
                                            });
                                          } else if (e.code == 'email-already-in-use') {
                                            Fluttertoast.showToast(msg: e.code);
                                            print('The account already exists for that email.');
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        } catch (e) {
                                          print(e.toString());
                                          Fluttertoast.showToast(msg: e);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.2,
                              Container(
                                child: TextButton(
                                  child: Text(
                                    "Already account? Login",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 165, 0, .6)),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            ))),
    );
  }
}
