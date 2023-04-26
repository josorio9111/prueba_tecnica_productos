import 'package:flutter/material.dart';
import 'package:prueba_tecnica/domain/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cart = [];
  int total = 0;

  getTotalPrice() async {
    int aux = 0;
    for (var c in cart) {
      aux += c.cantidad * c.product.price!;
    }
    total = aux;
    notifyListeners();
  }

  void adicionar(CartModel cartModel) {
    bool esta = false;
    for (var c in cart) {
      if (c.product.title == cartModel.product.title) {
        esta = true;
        break;
      }
    }
    if (esta) {
      final index = cart.indexWhere(
          (element) => element.product.title == cartModel.product.title);
      cart[index].cantidad++;
    } else {
      cart.add(cartModel);
    }
    getTotalPrice();
  }

  void eliminar(CartModel cartModel) {
    if (cartModel.cantidad == 1) {
      cart.remove(cartModel);
    } else {
      cartModel.cantidad--;
    }
    getTotalPrice();
  }

  void eliminarTodo() {
    cart = [];
    getTotalPrice();
  }
}
