import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title;
  final int quantity;
  final double price;
  CartItem(
      {required this.id,
      required this.title,
      this.quantity = 1,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  double get totalOfItems {
    double sum = 0;
    _cartItems.forEach((key, value) {
      sum += value.quantity * value.price;
    });
    return sum;
  }

  void addItem(String id, double price, String title) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
          id,
          (e) => CartItem(
              id: e.id,
              title: e.title,
              price: e.price,
              quantity: e.quantity + 1));
    } else {
      _cartItems.putIfAbsent(
        id,
        () =>
            CartItem(id: DateTime.now().toString(), title: title, price: price),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
