import 'package:d2dcourier/Order.dart';
import 'package:d2dcourier/dashboard.dart';
import 'package:d2dcourier/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Booking.dart';
import '../ProfilePage.dart';

String Name = 'XYZ';
String Email = 'xyz@gmail.com';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

// function to fetch user name from Database
String user_name() {
  var details = getCurrentUserData();
  if (details != null) {
    details.then((value) {
      Name = value[0];
      print(value[0]);
    });
    return Name;
  } else {
    return 'XYZ';
  }
}

// function to fetch user email from Database
String user_email() {
  var details1 = getCurrentUserData();
  if (details1 != null) {
    details1.then((value) {
      Email = value[1];
      //print(Name);
    });
    return Email;
  } else {
    return 'XYZ';
  }
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 15);

  @override
  Widget build(BuildContext context) {
    final name = user_name();
    final email = user_email();
    final urlImage =
        'https://clipartart.com/images/facebook-profile-icon-clipart-7.png';
    return Drawer(
      child: Material(
          color: Color.fromRGBO(255, 140, 0, .8),
          child: ListView(
            padding: padding,
            children: <Widget>[
              buildHeader(
                context,
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                )),
              ),
              Divider(color: Colors.white),
              const SizedBox(height: 8),
              // Side Navigation Menu
              buildMenuItem(
                text: 'People',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 10),
              buildMenuItem(
                text: 'Favourites',
                icon: Icons.favorite_border,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 10),
              buildMenuItem(
                text: 'Bookings',
                icon: Icons.shopping_bag_outlined,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 10),
              buildMenuItem(
                text: 'Orders',
                icon: Icons.history,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 10),
              buildMenuItem(text: 'Settings', icon: Icons.settings),
              const SizedBox(height: 20),
              Divider(color: Colors.white),
              const SizedBox(height: 20),
              buildMenuItem(
                  text: '24X7 Help & Support', icon: Icons.live_help_outlined),
              const SizedBox(height: 10),
              buildMenuItem(
                text: 'Log out',
                icon: Icons.logout_outlined,
                onClicked: () => selectedItem(context, 5),
              ),
            ],
          )),
    );
  }

// Attribute to side Menu
  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color, size: 30),
      title: Text(
        text,
        style: TextStyle(color: color),
        textScaleFactor: 1.1,
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

// Menu Clicklistener function
  void selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => dashboard(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => dashboard(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Booking(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Orders(),
        ));
        break;

      case 5:
        logout(context);
        break;
    }
  }

// Profile Page Menu
  Widget buildHeader(BuildContext context,
      {String urlImage, String name, String email, VoidCallback onClicked}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.only(top: 55, bottom: 20)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(urlImage),
                backgroundColor: Colors.orangeAccent,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
