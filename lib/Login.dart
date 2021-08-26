import 'package:d2dcourier/Autheticate.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/database.dart';
import 'package:d2dcourier/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/FadeAnimation.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Loader.dart';

class Login extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<Login> {

  final Email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void validate(){
    if(_formKey.currentState.validate()){
      print("Validated");
    }else{
      print("Not Validate");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .3),
                    blurRadius: 20.0,
                    offset: Offset(0, 10)
                )
              ]),
              child: Loader()
          ),
        )
            : SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Images/background1.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        width: 80,
                        height: 435,
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
                        left: 110,
                        width: 90,
                        height: 100,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.3,
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
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
                                          color: Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom:
                                              BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: MultiValidator(
                                            [
                                              RequiredValidator(errorText: "Email is Mandatory"),
                                              EmailValidator(errorText: "Not A Valid Email"),
                                            ]
                                        ),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle:
                                            TextStyle(color: Colors.black54)),
                                        controller: Email,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        obscureText: true,
                                        validator: RequiredValidator(errorText: "Password is Mandatory"),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle:
                                            TextStyle(color: Colors.black54)),
                                        controller: password,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              1.7,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(255,140,0,.8),
                                      Color.fromRGBO(255,165,0,.6),
                                    ])),
                                child: Center(
                                  child: TextButton(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onPressed: (){
                                      if(Email.text!='' || password.text!="") {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        Loginuser(Email.text, password.text).then((user){

                                          if(user != null){
                                            print("Login Sucessfull");
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => dashboard())
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }else{
                                            print("Login Failed");
                                            toast(
                                                "Wrong Email or password",
                                                Toast.LENGTH_SHORT,
                                                ToastGravity.BOTTOM,
                                                Colors.red);
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        });
                                      }else{
                                        validate();
                                      }
                                    },
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          FadeAnimation(
                              1.2,
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child:Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255,165,0,.6)),
                                  ),
                                  onPressed: (){
                                    toast(
                                        Email.text,
                                        Toast.LENGTH_LONG,
                                        ToastGravity.BOTTOM,
                                        Colors.green);
                                  },
                                ),
                              )
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FadeAnimation(
                              1.2,
                              Container(
                                child: TextButton(
                                  child:Text(
                                    "New User? Sign up",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255,165,0,.6)),
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => register())
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                ),
                              )
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ));
  }
}

void toast(
    String msg, Toast toast, ToastGravity toastGravity, Color colors) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toast,
      gravity: toastGravity,
      backgroundColor: colors,
      textColor: Colors.white,
      fontSize: 16.0);
}