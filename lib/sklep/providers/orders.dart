import 'package:flutter/foundation.dart';

import './cart.dart';

// przechowuje zamówienia
class OrderItem {
  final List<CartItem> products;  //lista produktów

  OrderItem({

    @required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
