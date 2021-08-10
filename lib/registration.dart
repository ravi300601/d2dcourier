import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: register(),
));

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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