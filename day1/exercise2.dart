import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise2 extends StatelessWidget {
  const exercise2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
