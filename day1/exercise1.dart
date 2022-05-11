import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise1 extends StatelessWidget {
  const exercise1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Enter your name',
        style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
      ),
    );
  }
}
