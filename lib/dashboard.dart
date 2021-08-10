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
        title: Text("Second Route"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}