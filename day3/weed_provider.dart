import 'dart:ffi';

import 'package:flutter/material.dart';

class Weed {
  int? id = 0;
  String image = '';
  bool isAdd = false;
  String name = '';
  int price = 0;
  Weed(
      {this.id,
      this.image = '',
      this.isAdd = false,
      this.name = '',
      this.price = 0});
}

class WeedProvider extends ChangeNotifier {
  List<Weed> defaultCart = [];
  List<Weed> listWeed = [
    Weed(
        id: 1,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 1',
        price: 1000),
    Weed(
        id: 2,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 2',
        price: 1200),
    Weed(
        id: 3,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 3',
        price: 1400),
    Weed(
        id: 4,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 4',
        price: 1230),
    Weed(
        id: 5,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 5',
        price: 1500),
    Weed(
        id: 6,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 6',
        price: 1700),
    Weed(
        id: 7,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 7',
        price: 1800),
    Weed(
        id: 8,
        image: 'assets/images/logo.jpeg',
        isAdd: false,
        name: 'Cần loại 8',
        price: 1900)
  ];

  var amount = 0;

  void initData(List<Weed> list) {
    listWeed = list;
    notifyListeners();
  }

  void calculatePrice(int price) {
    amount = amount + price;
    notifyListeners();
  }

  void removeCart(int index) {
    defaultCart.removeAt(index);
    notifyListeners();
  }

  void updateList(int index) {
    listWeed[index].isAdd = !listWeed[index].isAdd;
    notifyListeners();
  }

  void updateCart(Weed weedItem) {
    defaultCart.add(weedItem);
    notifyListeners();
  }

  void clearCart() {
    defaultCart = [];
    amount = 0;
    for (var f in listWeed) {
      f.isAdd = false;
    }
    notifyListeners();
  }
}
