import 'package:flutter/material.dart';
import 'package:my_app/day1/exercise1.dart';
import 'package:my_app/day1/exercise2.dart';
import 'package:my_app/day1/exercise3.dart';
import 'package:my_app/day1/exercise4.dart';
import 'package:my_app/day1/exercise5.dart';
import 'package:my_app/day1/exercise6.dart';
import 'package:my_app/day1/exercise7.dart';
import 'package:my_app/day1/exercise8.dart';
import 'package:my_app/day2+/ex2.dart';
import 'package:my_app/day2+/ex3.dart';
import 'package:my_app/day2+/ex4.dart';

import 'package:my_app/day2/snake.dart';

import 'package:my_app/day2+/ex1.dart';
import 'package:my_app/day3/cart.dart';
import 'package:my_app/day3/login.dart';
import 'package:my_app/day3/home.dart';
import 'package:my_app/day3/weed_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeedProvider>(
      create: (context) => WeedProvider(),
      child: Consumer<WeedProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'Flutter Provider Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(brightness: Brightness.dark),
          ),
          routes: {
            "/": (context) => login(),
            '/home': (context) => home(),
            '/cart': (context) => cart()
          },
          onUnknownRoute: (RouteSettings settings) {
            String? unknow = settings.name;
            return MaterialPageRoute(
              builder: (context) => home(),
            );
          },
        ),
      ),
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MyHomePage(),
    //   onGenerateRoute: (RouteSettings settings) {
    //     switch (settings.name) {
    //       case '/screen2':
    //         MaterialPageRoute(builder: (context) => screen2());
    //         break;
    //       default:
    //     }
    //   },
    //   onUnknownRoute: (RouteSettings settings) {
    //     String? unknow = settings.name;
    //     return MaterialPageRoute(
    //       builder: (context) => screen2(),
    //     );
    //   },
    // );
  }
}

class MyHomePage extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: login(),
      ),
    );
  }
}
