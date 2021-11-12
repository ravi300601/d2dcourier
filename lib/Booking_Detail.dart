import 'package:d2dcourier/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'database.dart';

class Booking_Detail extends StatefulWidget {
  final String Bookingdoc;
  final String Drop,
      Pickup,
      Type,
      Weight,
      Volume,
      Date,
      Details,
      Amount,
      Status,
      Payment;
  const Booking_Detail(
      {Key key,
      @required this.Bookingdoc,
      @required this.Pickup,
      this.Drop,
      this.Type,
      this.Weight,
      this.Details,
      this.Volume,
      this.Date,
      this.Amount,
      this.Status,
      this.Payment})
      : super(key: key);
  @override
  _Booking_DetailState createState() => _Booking_DetailState();
}

class _Booking_DetailState extends State<Booking_Detail> {
  List userBookingList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await getBookinfList();

    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        userBookingList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.Bookingdoc,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Container(
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
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          'Pick-up Address',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        width: 360,
                        padding: EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            widget.Pickup,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.clip,
                            style: new TextStyle(
                                fontSize: 17, color: Colors.black),
                          ))
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          'Drop Address',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        width: 360,
                        padding: EdgeInsets.all(8.0),
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.navigation_rounded,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              widget.Drop,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.clip,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(9.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Courier Type',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              SizedBox(
                                width: 139,
                              ),
                              Text(
                                'Courier Status',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 19),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 192,
                                child: Text(
                                  widget.Type,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  width: 120,
                                  child: Text(
                                    "delivered",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 13),
                          padding: EdgeInsets.all(6.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Length Width Height',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                'Weight',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 21),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 192,
                                child: Text(
                                  widget.Volume + ' (cm)',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                  width: 120,
                                  child: Text(
                                    widget.Weight + " Kg",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(9.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Courier Info',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 19, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.Details,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
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
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(9),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Text(
                                        'Economy Courier',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        'Payment via ' + widget.Payment,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                  child: Text(
                                "\u{20B9} " + widget.Amount,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
