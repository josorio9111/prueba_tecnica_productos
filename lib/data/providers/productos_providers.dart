import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/di/Locator.dart';
import 'package:prueba_tecnica/domain/models/productos_model.dart';
import 'package:prueba_tecnica/domain/repository/productos_repository.dart';

class ProductosProvider extends ChangeNotifier {
  int limit = 20;
  int skip = -1;

  ProductosProvider() {
    getProductos();
  }
  List<Product> productos = [];
  List<Product> searchProductos = [];

  getProductos() async {
    final productResp =
        await getIt<ProductosRepository>().getProductos(skip++ * limit, limit);
    productos = [...productos, ...productResp];
    notifyListeners();
  }

  getProductosXCate(String nombreCateg) async {
    if (nombreCateg == 'Todos') {
      skip = -1;
      productos = [];
      return getProductos();
    }
    final productResp = await getIt<ProductosRepository>()
        .getProductosXCategoria(nombreCateg.toLowerCase());
    productos = productResp;
    notifyListeners();
  }

  searcProducto(String q) async {
    final results = await getIt<ProductosRepository>().searchProducto(q);
    searchProductos = results;
    notifyListeners();
  }
}
