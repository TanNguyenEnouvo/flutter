import 'package:flutter/material.dart';

import 'package:my_app/main.dart';

class exercise7 extends StatelessWidget {
  const exercise7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.yellow, spreadRadius: 4),
                  ],
                ),
                height: 50,
                width: 50,
                clipBehavior: Clip.hardEdge,
                child: Image(
                  image: NetworkImage(
                      'https://scontent.fsgn2-5.fna.fbcdn.net/v/t1.6435-9/120425574_348974003111389_5131045467303456749_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=cNOS12Wt-jIAX_myTA4&_nc_oc=AQlFOHvynf1jeGip4yBNxoFgdMD0wIvyUvvPvlIH5gLe53SN9c0b14SANam06qrzRaw&_nc_ht=scontent.fsgn2-5.fna&oh=00_AT9PWB9qi9J-w_tWLa4GadtAXvFLY0tZPQY8qXXV0pJKSg&oe=62678D0B'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tan Nguyen",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Mobile Developer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.yellow,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 8,
            child: Container(
              width: MediaQuery.of(context).size.width - 48,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Enouvo Coffee',
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 12.0,
                          color: Color.fromARGB(255, 245, 212, 21),
                        ),
                      ],
                      color: Color.fromARGB(255, 244, 242, 242),
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
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
                    "Salt coffee",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 12.0,
                            color: Color.fromARGB(255, 245, 212, 21),
                          ),
                        ],
                        color: Color.fromARGB(255, 244, 242, 242),
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
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
          image: AssetImage('assets/images/caphe.jpeg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      padding: EdgeInsets.all(24),
    );
  }
}
