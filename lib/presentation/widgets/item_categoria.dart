import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/categorias_provider.dart';
import 'package:prueba_tecnica/data/providers/productos_providers.dart';
import 'package:prueba_tecnica/domain/models/categoria_model.dart';

class CategoriaItem extends StatelessWidget {
  const CategoriaItem({
    super.key,
    required this.cateModel,
  });
  final CategoriaModel cateModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final provider =
            Provider.of<CategoriasProvider>(context, listen: false);
        final providerP =
            Provider.of<ProductosProvider>(context, listen: false);
        provider.setActivo(cateModel);
        providerP.getProductosXCate(provider.nombreActivo);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              cateModel.nombre[0].toUpperCase() + cateModel.nombre.substring(1),
              style: TextStyle(
                  fontWeight: cateModel.activo == true
                      ? FontWeight.bold
                      : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
