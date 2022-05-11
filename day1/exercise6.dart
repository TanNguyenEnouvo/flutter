import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise6 extends StatelessWidget {
  const exercise6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Editor's Choice",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'The Art of Dough',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Learn to make the perfect bread.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Tan Nguyen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banh_mi.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
