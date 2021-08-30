import 'package:d2dcourier/Animation/FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ResetScreen extends StatefulWidget {
    @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String email;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  void validate(){
    if(_formKey.currentState.validate()){
      print("Validated");
    }else{
      print("Not Validate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
          autovalidate: true,
          child: Column(
          children: <Widget>[
            FadeAnimation(
              1.2,
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
               onChanged: (value) {
                  setState(() {
                    email = value;
                  });
               },
               // controller: Email,
              ),
            ),
          ),
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
                        "Send Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: (){
                        validate();
                        if(email.isNotEmpty) {
                          auth.sendPasswordResetEmail(email: email);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                )),
          ],
        ),
          ),
    ),
    );
  }
}
