import 'package:prueba_tecnica/domain/models/productos_model.dart';

class CartModel {
  CartModel({this.cantidad = 1, required this.product});
  int cantidad;
  Product product;
}
