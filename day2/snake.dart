import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_app/main.dart';
import 'dart:math';

class snake extends StatefulWidget {
  const snake({Key? key}) : super(key: key);

  @override
  State<snake> createState() => _snakeState();
}

class Point {
  int? x = 0;
  int? y = 0;
  Point({this.x, this.y});
}

var snakeTimer;
Random random = new Random();
int initX = random.nextInt(10);
int initY = random.nextInt(10);

class _snakeState extends State<snake> {
  List<Point> snakePosition = [
    Point(x: 0, y: 0),
    Point(x: 40, y: 0),
    Point(x: 80, y: 0),
  ];

  List<int> foodPosition = [40 * initX, 40 * initY];

  var direction = 'down';
  void updateSnake() {
    var lastIndex = snakePosition.length - 1;

    setState(() {
      switch (direction) {
        case 'down':
          if (snakePosition[lastIndex].x! + 40 == foodPosition[0] &&
              snakePosition[lastIndex].y! == foodPosition[1]) {
            foodPosition = [
              snakePosition[lastIndex].x! - 40,
              snakePosition[lastIndex].y! + 80
            ];

            snakePosition.add(Point(
                x: snakePosition[lastIndex].x! + 40,
                y: snakePosition[lastIndex].y!));
            break;
          }

          snakePosition.add(Point(
              x: snakePosition[lastIndex].x! + 40,
              y: snakePosition[lastIndex].y!));
          snakePosition.removeAt(0);
          break;

        case 'up':
          if (snakePosition[lastIndex].x! - 40 == foodPosition[0] &&
              snakePosition[lastIndex].y! == foodPosition[1]) {
            foodPosition = [snakePosition[0].x! + 80, snakePosition[0].y! + 40];

            snakePosition.add(Point(
                x: snakePosition[lastIndex].x! - 40,
                y: snakePosition[lastIndex].y!));
            break;
          }

          snakePosition.add(Point(
              x: snakePosition[lastIndex].x! - 40,
              y: snakePosition[lastIndex].y!));
          snakePosition.removeAt(0);
          break;

        case 'left':
          if (snakePosition[lastIndex].y! - 40 == foodPosition[1] &&
              snakePosition[lastIndex].x! == foodPosition[0]) {
            foodPosition = [snakePosition[0].x! + 40, snakePosition[0].y! + 80];

            snakePosition.add(Point(
                x: snakePosition[lastIndex].x!,
                y: snakePosition[lastIndex].y! - 40));
            break;
          }

          snakePosition.add(Point(
              x: snakePosition[lastIndex].x!,
              y: snakePosition[lastIndex].y! - 40));
          snakePosition.removeAt(0);
          break;

        case 'right':
          if (snakePosition[lastIndex].y! + 40 == foodPosition[1] &&
              snakePosition[lastIndex].x! == foodPosition[0]) {
            foodPosition = [snakePosition[0].x! + 40, snakePosition[0].y! - 80];

            snakePosition.add(Point(
                x: snakePosition[lastIndex].x!,
                y: snakePosition[lastIndex].y! + 40));
            break;
          }

          snakePosition.add(Point(
              x: snakePosition[lastIndex].x!,
              y: snakePosition[lastIndex].y! + 40));
          snakePosition.removeAt(0);
          break;

        default:
      }
    });
  }

  void _showDialog(BuildContext context) {
    snakeTimer.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert!!"),
          content: new Text("You are awesome!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                setState(() {
                  direction = 'down';
                  snakePosition = [
                    Point(x: 0, y: 0),
                    Point(x: 40, y: 0),
                    Point(x: 80, y: 0),
                  ];
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void startGame() {
    const duration = const Duration(milliseconds: 1000);
    snakeTimer = Timer.periodic(duration, (timer) {
      if (snakePosition[(snakePosition.length - 1)].y == 400 ||
          snakePosition[(snakePosition.length - 1)].y! < 0 ||
          snakePosition[(snakePosition.length - 1)].x == 400 ||
          snakePosition[(snakePosition.length - 1)].x! < 0) {
        return _showDialog(context);
      } else {
        updateSnake();
      }
    });
  }

  void setDirection(String data) {
    setState(() {
      direction = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var boxWidth = screenWidth / 12;
    int randomNumber = random.nextInt(10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sờ nách game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Container(
                width: 400,
                height: 400,
                child: Stack(
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      decoration:
                          new BoxDecoration(color: Colors.pink.shade200),
                      child: Text(''),
                    ),
                    for (var item in snakePosition)
                      Positioned(
                        left: item.y?.toDouble(),
                        top: item.x?.toDouble(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.deepOrangeAccent),
                          ),
                          child: Text(''),
                        ),
                      ),
                    Positioned(
                      left: foodPosition[1].toDouble(),
                      top: foodPosition[0].toDouble(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.lightGreen),
                        ),
                        child: Text(''),
                      ),
                    ),
                  ],
                )),
          ),
          TextButton(
            onPressed: startGame,
            child: Text('Start'),
          ),
          TextButton(
            onPressed: () => setDirection('up'),
            child: Icon(
              Icons.arrow_circle_up_outlined,
              color: Colors.black,
              size: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => setDirection('left'),
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.black,
                  size: 50,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              TextButton(
                onPressed: () => setDirection('right'),
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.black,
                  size: 50,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () => setDirection('down'),
            child: Icon(
              Icons.arrow_circle_down,
              color: Colors.black,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
