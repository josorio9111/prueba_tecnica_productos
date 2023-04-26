import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/categorias_provider.dart';
import 'package:prueba_tecnica/domain/models/productos_model.dart';
import 'package:prueba_tecnica/presentation/widgets/item_product.dart';

class ListaProductos extends StatefulWidget {
  const ListaProductos(
      {super.key, required this.nextProductos, required this.products});
  final Function? nextProductos;
  final List<Product> products;

  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_listener);
    super.initState();
  }

  _listener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      if (widget.nextProductos != null) {
        widget.nextProductos!();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => const Divider(color: Colors.grey),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final provider =
              Provider.of<CategoriasProvider>(context, listen: false);
          final product = widget.products[index];
          final arreglo = product.title!.split(' ').join('-').toLowerCase();
          final nombreCategoria =
              provider.nombreActivo.isEmpty ? 'Todos' : provider.nombreActivo;
          product.heroId =
              'home-$arreglo-${nombreCategoria.toLowerCase()}-${product.category}';
          // print(product.heroId);
          return ItemProduct(product: product);
        });
  }
}
