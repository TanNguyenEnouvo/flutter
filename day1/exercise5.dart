import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise5 extends StatelessWidget {
  const exercise5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(
                  'https://petplaza.vn/wp-content/uploads/welsh-corgi-2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            child: Image(
              image: AssetImage('assets/images/dog.jpeg'),
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
