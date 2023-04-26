import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/categorias_provider.dart';
import 'package:prueba_tecnica/presentation/widgets/item_categoria.dart';
import 'package:prueba_tecnica/presentation/widgets/search_delegate.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriasProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                showSearch(
                    context: context, delegate: ProductoSearchDelegate());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 230,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text('Buscar productos')
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'cart');
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(CupertinoIcons.cart),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: const Icon(Icons.filter_list),
            ),
            if (provider.categorias.isEmpty) ...[
              const Expanded(
                child: Center(
                  child: SizedBox(width: 200, child: LinearProgressIndicator()),
                ),
              )
            ] else ...[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: provider.categorias.map((e) {
                    return CategoriaItem(
                      cateModel: e,
                    );
                  }).toList()),
                ),
              ),
            ],
          ],
        )
      ],
    );
  }
}
