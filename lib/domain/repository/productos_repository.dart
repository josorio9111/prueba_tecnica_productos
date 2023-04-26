import 'package:prueba_tecnica/domain/models/productos_model.dart';

abstract class ProductosRepository {
  Future<List<Product>> getProductos(int skip, int limit);

  Future<List<Product>> searchProducto(String q);

  Future<List<Product>> getProductosXCategoria(String categoria);

  Future<List<String>> getCategorias();
}
