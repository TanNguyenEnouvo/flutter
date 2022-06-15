import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/day3/home.dart';
import 'package:my_app/day3/weed_provider.dart';

import 'package:my_app/main.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _State();
}

class _State extends State<login> {
  String displayText = '';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final myController = TextEditingController();

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 180,
              ),
              // Text('Shop Hiền Hồ'),
              // Text('Thích chơi đồ tới shop Hiền Hồ'),
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: TextFormField(
                  controller: myController,
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: UnderlineInputBorder(),
                    labelText: 'Username',
                    floatingLabelStyle: const TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: TextFormField(
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                    floatingLabelStyle: const TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 10,
              ),
              SizedBox(
                width: screenWidth - 80,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // Route route = MaterialPageRoute(
                    //   builder: (context) => const screen2(),
                    // );
                    // Navigator.push(
                    //   context,
                    //   route,
                    // );
                    if (myController.text != '') {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade900,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
