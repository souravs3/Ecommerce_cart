import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _carts = [];
  List<Product> get carts => _carts;

  void toggleFavorite(Product product) {
    if (_carts.contains(product)) {
      for (Product element in _carts) {
        element.quantity++;
      }
    } else {
      _carts.add(product);
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    _carts.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _carts.removeAt(index);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _carts[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_carts[index].quantity > 1) {
      _carts[index].quantity--;
      notifyListeners();
    }
  }

  totalPrice() {
    double totals = 0.00;
    for (Product element in _carts) {
      totals += element.price * element.quantity;
    }
    return totals;
  }

  Widget productQuantity(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.add) {
          incrementQuantity(index);
        } else {
          decrementQuantity(index);
        }
      },
      child: Icon(icon),
    );
  }

  static CartProvider of<CartProvider>(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of(context, listen: listen);
  }
}
