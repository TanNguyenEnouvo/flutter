import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise8 extends StatelessWidget {
  const exercise8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fooderlich'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.grey.shade800,
        padding: EdgeInsets.fromLTRB(15, 50, 15, 50),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.white,
                        size: 42,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Recipe Trends',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Wrap(
                spacing: 8,
                children: [
                  for (final i in [
                    'Healthy',
                    'Vegan',
                    'Carrots',
                    'Greens',
                    'Wheat',
                    'Pescetarian',
                    'Mint',
                    'Lemongrass'
                  ])
                    Chip(
                      backgroundColor: Colors.black,
                      label: Text(
                        i,
                        style: TextStyle(color: Colors.white),
                      ),
                      deleteIcon: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.close_sharp,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                      onDeleted: () {},
                    ),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/images/caphe.jpeg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          padding: EdgeInsets.all(24),
        ),
      ),
    );
  }
}
