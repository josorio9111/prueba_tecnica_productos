import 'package:flutter/material.dart';
import 'package:prueba_tecnica/di/Locator.dart';
import 'package:prueba_tecnica/domain/models/categoria_model.dart';
import 'package:prueba_tecnica/domain/repository/productos_repository.dart';

class CategoriasProvider extends ChangeNotifier {
  String nombreActivo = '';
  List<CategoriaModel> categorias = [];
  CategoriasProvider() {
    getCategorias();
  }

  getCategorias() async {
    final categoriasResp = await getIt<ProductosRepository>().getCategorias();
    late List<CategoriaModel> aux = [];
    categorias.add(CategoriaModel(nombre: 'Todos', activo: true));
    for (var c in categoriasResp) {
      aux.add(CategoriaModel(nombre: c));
    }
    categorias = [...categorias, ...aux];
    notifyListeners();
  }

  setActivo(CategoriaModel cateModel) {
    for (var c in categorias) {
      if (c.nombre == cateModel.nombre) {
        final index = categorias
            .indexWhere((element) => element.nombre == cateModel.nombre);
        categorias[index].activo = true;
        nombreActivo = categorias[index].nombre;
      } else {
        c.activo = false;
      }
    }
    notifyListeners();
  }
}
