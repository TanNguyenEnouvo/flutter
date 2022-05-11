import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

List<String> listButton = [
  'C',
  '<-',
  '%',
  '/',
  '7',
  '8',
  '9',
  'X',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
];

class ex1 extends StatefulWidget {
  const ex1({Key? key}) : super(key: key);

  @override
  State<ex1> createState() => _State();
}

class _State extends State<ex1> {
  String displayText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: false,
        backgroundColor: Colors.brown,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        print('hello');
        return Container(
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.3,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                padding: EdgeInsets.only(bottom: 20),
                child: SingleChildScrollView(
                  child: Text(
                    displayText,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
              Wrap(
                children: [
                  for (var i = 0; i < 16; i++)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          displayText += listButton[i];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (i + 1) % 4 == 0
                              ? Colors.orange
                              : i == 0 || i == 1 || i == 2
                                  ? Colors.grey
                                  : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(
                              (MediaQuery.of(context).size.width / 4 - 20) / 2),
                        ),
                        width: MediaQuery.of(context).size.width / 4 - 20,
                        height: MediaQuery.of(context).size.width / 4 - 20,
                        child: Center(
                          child: Text(
                            listButton[i],
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  for (var item in ['0', '.', '='])
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        alignment: item == '0'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: item == '='
                              ? Colors.grey.shade300
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(
                              (MediaQuery.of(context).size.width / 3 - 20) / 2),
                        ),
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.width / 5.5 - 20,
                        child: item == '.'
                            ? Center(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              )
                            : Text(
                                item,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                      ),
                    ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
