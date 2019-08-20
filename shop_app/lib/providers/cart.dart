import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId, (existingCartItem) => updateCart(existingCartItem));
    } else {
      _items.putIfAbsent(productId, () => createCart(title, price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += (cartItem.price * cartItem.quantity);
    });

    return total;
  }

  CartItem updateCart(CartItem existingCartItem) {
    return CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity + 1);
  }

  CartItem createCart(title, price) {
    return CartItem(
        id: DateTime.now().toString(), title: title, price: price, quantity: 1);
  }
}
