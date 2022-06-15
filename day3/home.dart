import 'package:flutter/material.dart';
import 'package:my_app/day3/weed_provider.dart';

import 'package:my_app/main.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _State();
}

class _State extends State<home> {
  String displayText = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Weed World',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(
              Icons.shopify,
              size: 28,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        WeedProvider weedProvider =
            Provider.of<WeedProvider>(context, listen: false);
        var listWeed = weedProvider.listWeed;
        var cart = weedProvider.defaultCart;

        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: ListView.builder(
                    itemCount: listWeed.length,
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
                                      image: AssetImage(listWeed[index].image),
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
                                      Center(child: Text(listWeed[index].name)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                          child: Text(
                                              listWeed[index].price.toString() +
                                                  '\$')),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      var currentIndex = cart.indexWhere(
                                          (ele) =>
                                              ele.id == listWeed[index].id);

                                      if (!listWeed[index].isAdd) {
                                        weedProvider
                                            .updateCart(listWeed[index]);
                                        weedProvider.calculatePrice(
                                            listWeed[index].price);
                                      } else {
                                        weedProvider.calculatePrice(
                                            -cart[currentIndex].price);
                                        weedProvider.removeCart(currentIndex);
                                      }
                                      weedProvider.updateList(index);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: listWeed[index].isAdd
                                          ? [
                                              Icon(
                                                Icons.check,
                                                size: 28,
                                                color: Colors.orange,
                                              )
                                            ]
                                          : [
                                              Icon(
                                                Icons.flight_takeoff_rounded,
                                                size: 28,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Center(
                                                child: Text(
                                                  'Get High',
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                ),
                                              ),
                                            ],
                                    ),
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
            ],
          ),
        );
      }),
    );
  }
}
