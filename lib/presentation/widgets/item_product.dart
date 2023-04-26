import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/cart_provider.dart';
import 'package:prueba_tecnica/domain/models/cart_model.dart';
import 'package:prueba_tecnica/domain/models/productos_model.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: product);
      },
      horizontalTitleGap: 10,
      leading: Hero(
        tag: product.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
              width: 80,
              height: 120,
              fit: BoxFit.cover,
              image: NetworkImage(product.thumbnail.toString()),
              placeholder: const AssetImage('assets/no-image.png')),
        ),
      ),
      title: Text(
        product.title.toString(),
        maxLines: 2,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
      subtitle: Text(
        '\$${product.price}',
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
      ),
      trailing: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Se adicionó al carrito',
              style: TextStyle(fontSize: 18),
            ),
            duration: Duration(milliseconds: 1500),
          ));
          provider.adicionar(CartModel(product: product));
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            CupertinoIcons.cart_badge_plus,
            color: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}
