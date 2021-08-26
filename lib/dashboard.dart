import 'package:d2dcourier/database.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: dashboard(),
));

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => logout(context),
          child: Text('Logout'),
        ),
      ),
    );
  }
}