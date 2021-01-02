import 'package:flutter/foundation.dart';
//import 'package:Avatar/Mission.dart';
//import 'package:Avatar/Creation.dart';

import 'package:Avatar/main.dart';
import 'package:Avatar/item.dart';

//element dodany do koszyka

class CartItem {
  final String id;  // id naklejki
  final String title;   //nazwa naklejki
  final int quantity;   // ilosc  = 1
  final double price;   // cena naklejki
  final String path;    // ścieżka do naklejki w assets

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.path,

  });
}

class Cart with ChangeNotifier {

  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  //obliczenie ceny zamówienia
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  //dodanie  naklejki
  void addItem(
    String productId,
    double price,
    String title,
    String path,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              path: existingCartItem.path,
              quantity:  1,
            ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1,
              path: path,
            ),
      );
    }
    notifyListeners();
  }

  // usuniecie naklejki
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }


  // wyczyszczenie koszyka po kupieniu naklejek
  void clear() {
   // var total;
   // _items.forEach((key, cartItem) {
   //   total += cartItem.price * cartItem.quantity;
   // });
   // klient.points = klient.points-total;

    _items.forEach((key, cartItem) {
      Item item = new Item(cartItem.title, cartItem.price, cartItem.path);
      klient.products.add(item);
    });
    _items = {};
    notifyListeners();
  }
}
