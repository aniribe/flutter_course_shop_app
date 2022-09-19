import 'package:flutter/material.dart';
import 'package:flutter_course_shop_app/models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items;

  Map<String, CartItem> get items {
    return {...?_items};
  }

  void addItem(String productId, double price, String title) {
    if (_items?.containsKey(productId) as bool) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items?.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
  }
}
