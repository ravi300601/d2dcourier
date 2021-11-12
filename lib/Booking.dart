import 'package:d2dcourier/Animation/FadeAnimation.dart';
import 'package:d2dcourier/Payment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'database.dart';

class Booking extends StatefulWidget {
  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<Booking> {
  final Pick_Address = TextEditingController();
  final Drop_Address = TextEditingController();
  int type = 0;
  final length = TextEditingController();
  final width = TextEditingController();
  final weigth = TextEditingController();
  final height = TextEditingController();
  final courier_info = TextEditingController();

  var status = true;

  final _formKey = GlobalKey<FormState>();

// Booking Page Validation Function
  void validate() {
    if (_formKey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validate");
    }
  }

// Booking Page GUI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Booking',
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  1.5,
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Pick-Up & Drop Address',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.all(4),
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
                                  bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: "This field is Mandatory"),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Pick-up Address",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: Pick_Address,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: "This feild is Mandatory"),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Drop Address",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: Drop_Address,
                            ),
                          ),
                        ],
                      ),
                    )),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Courier Type',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ToggleSwitch(
                          labels: ['Envelope', 'Box Pack', 'Other'],
                          totalSwitches: 3,
                          initialLabelIndex: 0,
                          fontSize: 18,
                          minHeight: 50,
                          minWidth: 115,
                          cornerRadius: 40,
                          radiusStyle: true,
                          activeBgColor: [Colors.orangeAccent],
                          inactiveBgColor: Colors.white,
                          inactiveFgColor: Colors.black54,
                          borderColor: [Color.fromRGBO(143, 148, 251, .2)],
                          borderWidth: 2,
                          onToggle: (index) {
                            print('switched to: $index');
                            type = index;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 18),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Courier Details',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 177.5,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: "This field is Mandatory"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Length (cm)",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: length,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 177.5,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: "This field is Mandatory"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Width (cm)",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: width,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 177.5,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: "This field is Mandatory"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Height (cm)",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: height,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 177.5,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: "This field is Mandatory"),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Weight (kg)",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: weigth,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                            padding: EdgeInsets.all(5.0),
                            height: 100,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              maxLines: 3,
                              validator: RequiredValidator(
                                  errorText: "This field is Mandatory"),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "Enter Courier info (i.e thing in package)",
                                  hintStyle: TextStyle(color: Colors.black54)),
                              controller: courier_info,
                            ),
                          ),
                        ],
                      ),
                    )),
                FadeAnimation(
                  1.5,
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(top: 50),
                    height: 50,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orangeAccent,
                      child: Text("Continue"),
                      onPressed: () async {
                        validate();
                        if (Pick_Address.text != "" &&
                            Drop_Address.text != "" &&
                            length.text != "" &&
                            weigth.text != "" &&
                            width.text != "" &&
                            height.text != "") {
                          try {
                            await Firebase.initializeApp();
                            userBooking(
                                Pick_Address.text,
                                Drop_Address.text,
                                type.toInt(),
                                length.text,
                                weigth.text,
                                width.text,
                                height.text,
                                courier_info.text);
                          } catch (e) {}

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment()));
                        } else {
                          validate();
                        }
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
