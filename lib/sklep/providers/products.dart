import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'sun glasses',
      price: 30,
      path: "assets/icons8-sun-glasses-100.png",
    ),
    Product(
      id: 'p2',
      title: 'flower',
      price: 40,
      path: "assets/icons8-spa-flower-100.png",

    ),
    Product(
      id: 'p3',
      title: 'witch hat',
      price: 20,
      path: "assets/icons8-witch-100.png",

    ),
    Product(
      id: 'p4',
      title: 'bow tie',
      price: 20,
      path: "assets/icons8-bow-tie-100-2.png",
    ),
    Product(
      id: 'p5',
      title: 'bow tie',
      price: 30,
      path: "assets/icons8-bow-tie-100.png",
    ),
    Product(
      id: 'p6',
      title: 'beanie',
      price: 10,
      path: "assets/icons8-beanie-64.png",
    ),
    Product(
      id: 'p7',
      title: 'joker hat',
      price: 30,
      path: "assets/icons8-joker-100-2.png",
    ),
    Product(
      id: 'p8',
      title: 'bow',
      price: 20,
      path: "assets/bow.png",
    ),
    Product(
      id: 'p9',
      title: 'viking hat',
      price: 40,
      path: "assets/viking-hat.png",
    ),
    Product(
      id: 'p10',
      title: 'graduation hat',
      price: 30,
      path: "assets/graduation-hat.png",
    ),
    Product(
      id: 'p11',
      title: 'glasses',
      price: 50,
      path: "assets/glasses-1.png",
    ),
    Product(
      id: 'p12',
      title: 'glasses',
      price: 20,
      path: "assets/glasses-2.png",
    ),
    Product(
      id: 'p13',
      title: 'cartoon eyes',
      price: 20,
      path: "assets/cartoon-eyes-1.png",
    ),
    Product(
      id: 'p14',
      title: 'cartoon eyes',
      price: 30,
      path: "assets/cartoon-eyes-6.png",
    ),
    Product(
      id: 'p15',
      title: 'afro',
      price: 40,
      path: "assets/afro.png",
    ),

  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
