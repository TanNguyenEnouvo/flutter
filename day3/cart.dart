import 'package:flutter/material.dart';
import 'package:my_app/day3/weed_provider.dart';

import 'package:my_app/main.dart';
import 'package:provider/provider.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _State();
}

class _State extends State<cart> {
  String displayText = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        WeedProvider weedProvider =
            Provider.of<WeedProvider>(context, listen: false);
        var cart = weedProvider.defaultCart;
        var listWeed = weedProvider.listWeed;

        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/logo.jpeg'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child: Text(cart[index].name)),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Center(
                                          child: Text(
                                              cart[index].price.toString() +
                                                  '\$')),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: TextButton(
                                          onPressed: () {
                                            var currentIndex =
                                                listWeed.indexWhere((ele) =>
                                                    ele.id == cart[index].id);
                                            weedProvider.calculatePrice(
                                                -cart[index].price);
                                            weedProvider
                                                .updateList(currentIndex);
                                            weedProvider.removeCart(index);
                                          },
                                          child: Icon(
                                            Icons.cancel,
                                            size: 28,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.green.shade900),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Total:',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " " + weedProvider.amount.toString() + "\$",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.yellow.shade900,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(flex: 1, child: Container()),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Center(child: Text('Thanks sir')),
                                    content: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/snoop.gif'),
                                                fit: BoxFit.fitHeight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      new IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          weedProvider.clearCart();
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.smoking_rooms_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Buy',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.shade900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        );
      }),
    );
  }
}
