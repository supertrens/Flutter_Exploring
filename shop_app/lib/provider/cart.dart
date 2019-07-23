import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (oldValue) => _updateCartItem(oldValue));
    } else {
      CartItem newItem = new CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price);
      _items.putIfAbsent(productId, () => newItem);
    }
  }

  CartItem _updateCartItem (CartItem oldCartValue){
    return new CartItem(
      id:oldCartValue.id,
      title: oldCartValue.title,
      quantity: oldCartValue.quantity + 1,
      price: oldCartValue.price
    );
  }
}
