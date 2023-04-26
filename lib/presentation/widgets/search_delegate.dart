import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/productos_providers.dart';
import 'package:prueba_tecnica/domain/models/productos_model.dart';

class ProductoSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar productos';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.search,
        color: Colors.black38,
        size: 130,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final provider = Provider.of<ProductosProvider>(context, listen: false);
    provider.searcProducto(query);

    return ListView.builder(
        itemCount: provider.searchProductos.length,
        itemBuilder: (_, int index) =>
            _MovieItem(provider.searchProductos[index]));
  }
}

class _MovieItem extends StatelessWidget {
  final Product product;

  const _MovieItem(this.product);

  @override
  Widget build(BuildContext context) {
    product.heroId = 'search-${product.id}';

    return ListTile(
      leading: Hero(
        tag: product.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.png'),
            image: NetworkImage(product.thumbnail!),
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(product.title!),
      subtitle: Text('\$${product.price}', maxLines: 1),
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: product);
      },
    );
  }
}
