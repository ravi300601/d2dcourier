import 'package:d2dcourier/Booking.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Animation/FadeAnimation.dart';
import 'Booking_Detail.dart';
import 'database.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List userBookingList = [];

  //default constructor
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

// sending booking data to another page
  getBookingdetail(
      String userBookingid,
      String PickupAdd,
      String DropAdd,
      String Type,
      String Weight,
      String Details,
      String Volume,
      String Date,
      String Amount,
      String Status,
      String Payment,
      BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Booking_Detail(
                Bookingdoc: userBookingid,
                Pickup: PickupAdd,
                Drop: DropAdd,
                Type: Type,
                Weight: Weight,
                Details: Details,
                Volume: Volume,
                Date: Date,
                Amount: Amount,
                Status: Status,
                Payment: Payment)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Orders',
        ),
      ),
      body: FadeAnimation(
        1.5,
        Container(
          child: ListView.builder(
            itemCount: userBookingList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  enabled: true,
                  isThreeLine: true,
                  onTap: () => getBookingdetail(
                      userBookingList[index]['Order Id'],
                      userBookingList[index]['Pick-up'],
                      userBookingList[index]['drop'],
                      userBookingList[index]['type'],
                      userBookingList[index]['weight'],
                      userBookingList[index]['details'],
                      userBookingList[index]['length'] +
                          " X " +
                          userBookingList[index]['width'] +
                          " X " +
                          userBookingList[index]['height'],
                      userBookingList[index]['Date'],
                      userBookingList[index]['Amount'],
                      userBookingList[index]['Status'],
                      userBookingList[index]['Payment'],
                      context),
                  hoverColor: Colors.black,
                  subtitle: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userBookingList[index]['Date'],
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        height: 7,
                        color: Colors.black54,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Order Id: ' +
                              '${userBookingList[index]['Order Id']}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    '${userBookingList[index]['type']}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('assets/Images/courier.png'),
                    ),
                  ),
                  trailing: Column(
                    children: <Widget>[
                      Text(
                        userBookingList[index]['Status'],
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        userBookingList[index]['length'] +
                            " X " +
                            userBookingList[index]['width'] +
                            " X " +
                            userBookingList[index]['height'],
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.all(7),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
