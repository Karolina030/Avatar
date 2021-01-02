import 'package:flutter/foundation.dart';

//klasa reprezentująca pojedynczą naklejkę
class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String path;

  Product({
    @required this.id,
   @required this.title,
    @required this.price,
    @required this.path,
  });

}
