import 'package:d2dcourier/Animation/FadeAnimation.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/database.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String dropdownvalue = "Economy Delivery";
  String dropdownrupee = "23";

  var items = ["Economy Delivery", "Delux Delivery", "Premium Delivery"];

  int selectedRadioTile;

  String Payment_mode;

// Contruc
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  UpdateData(String payment, String amount, String delivery) async {
    await updateUserList(payment, amount, delivery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Payment modes"),
        ),
        body: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              FadeAnimation(
                  1.5,
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text('Select Delivery Mode'),
                  )),
              FadeAnimation(
                1.5,
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      DropdownButton(
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                        isExpanded: true,
                        items: items.map((itemsname) {
                          return DropdownMenuItem(
                              value: itemsname, child: Text(itemsname));
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            if (newValue == "Economy Delivery") {
                              dropdownrupee = '34';
                            }
                            if (newValue == "Delux Delivery") {
                              dropdownrupee = '70';
                            }
                            if (newValue == "Premium Delivery") {
                              dropdownrupee = '150';
                            }
                            dropdownvalue = newValue;
                          });
                        },
                        value: dropdownvalue,
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
                        borderRadius: BorderRadius.circular(15),
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
                          child: TextField(
                            decoration: InputDecoration(
                                enabled: false,
                                border: InputBorder.none,
                                hintText:
                                    'Total Amount \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\u{20B9} ' +
                                        dropdownrupee,
                                hintStyle: TextStyle(color: Colors.black54)),
                          ),
                        ),
                      ],
                    ),
                  )),
              FadeAnimation(
                  1.5,
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Select Payment Mode'),
                  )),
              FadeAnimation(
                  1.5,
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RadioListTile(
                            value: 1,
                            groupValue: selectedRadioTile,
                            activeColor: Colors.orangeAccent,
                            title: Text("Cash on Pickup"),
                            subtitle: Text("Pay while pick a delivery"),
                            onChanged: (val) {
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                              Payment_mode = "Cash on Pickup";
                            }),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                            value: 2,
                            groupValue: selectedRadioTile,
                            activeColor: Colors.orangeAccent,
                            title: Text("Cash on Delivery"),
                            subtitle: Text("Pay while drop a delivery"),
                            onChanged: (val) {
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                              Payment_mode = "Cash on Delivery";
                            }),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                            value: 3,
                            groupValue: selectedRadioTile,
                            activeColor: Colors.orangeAccent,
                            title: Text("PayPal"),
                            subtitle: Text("Pay from Paypal Account"),
                            onChanged: (val) {
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                              Payment_mode = "Paypal";
                            }),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        RadioListTile(
                            value: 4,
                            groupValue: selectedRadioTile,
                            activeColor: Colors.orangeAccent,
                            title: Text("Cards"),
                            subtitle: Text("Pay using Debit/Credit cards"),
                            onChanged: (val) {
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                              Payment_mode = "Cards";
                            }),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 90,
              ),
              FadeAnimation(
                  1.7,
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
                          "Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          UpdateData(
                              Payment_mode, dropdownrupee, dropdownvalue);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dashboard()));
                        },
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
