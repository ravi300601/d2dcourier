import 'package:d2dcourier/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard(),
    ));

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          title: Text("Dashboard"),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => logout(context),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
