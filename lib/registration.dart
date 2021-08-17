import 'package:d2dcourier/main.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: register(),
));

class register extends StatelessWidget {
  final Email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final fName = TextEditingController();
  final lName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/background1.png'),
                    fit: BoxFit.fill    )),
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
                                image: AssetImage('assets/Images/image.png')
                              )
                            ),
                          )
                        ),
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
                      right:120,
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
                              color: Color.fromRGBO(143, 148, 251, .3),
                              blurRadius: 20.0,
                              offset: Offset(0,10))
                          ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "First Name",
                                  hintStyle: TextStyle(color: Colors.black54)),
                                controller: fName,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(color: Colors.black54)),
                                controller: lName,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone No.",
                                    hintStyle: TextStyle(color: Colors.black54)),
                                controller: phoneNo,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.black54)),
                                controller: Email,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.black54)),
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
                      1.6,
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255,140,0,.8),
                              Color.fromRGBO(255,165,0,.6),
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
                          ),
                        ),
                      )
                    ),
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
                              color: Color.fromRGBO(255,165,0,.6)),
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => HomePage())
                            );
                          },
                        ),
                      )
                    )
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }
}