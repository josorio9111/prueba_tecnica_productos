import 'dart:convert';

import 'package:http/http.dart';
import 'package:prueba_tecnica/domain/models/categorias_model.dart';
import 'package:prueba_tecnica/domain/models/productos_model.dart';
import 'package:prueba_tecnica/domain/repository/productos_repository.dart';

class ProductosRepoImpl extends ProductosRepository {
  ProductosRepoImpl(this._client);
  final Client _client;

  @override
  Future<List<String>> getCategorias() async {
    final url = Uri.https('dummyjson.com', 'products/categories');
    final resp = await _client.get(url);
    return categoriasFromJson(resp.body);
  }

  @override
  Future<List<Product>> getProductos(int skip, int limit) async {
    final url = Uri.https(
        'dummyjson.com', 'products', {'skip': '$skip', 'limit': '$limit'});
    final resp = await _client.get(url);
    final parse = json.decode(resp.body);
    return ResponseProductos.fromJson(parse).products!;
  }

  @override
  Future<List<Product>> getProductosXCategoria(String categoria) async {
    final url = Uri.https('dummyjson.com', 'products/category/$categoria');
    final resp = await _client.get(url);
    final parse = json.decode(resp.body);
    return ResponseProductos.fromJson(parse).products!;
  }

  @override
  Future<List<Product>> searchProducto(String q) async {
    final url = Uri.https('dummyjson.com', 'products/search', {'q': q});
    final resp = await _client.get(url);
    final parse = json.decode(resp.body);
    return ResponseProductos.fromJson(parse).products!;
  }
}
