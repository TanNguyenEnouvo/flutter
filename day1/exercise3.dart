import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise3 extends StatelessWidget {
  const exercise3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tan Nguyen',
            style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
          SizedBox(height: 30),
          Text(
            '1999',
            style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
