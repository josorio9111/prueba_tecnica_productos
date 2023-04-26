import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/cart_provider.dart';
import 'package:prueba_tecnica/presentation/widgets/bottom_panel_cart.dart';
import 'package:prueba_tecnica/presentation/widgets/item_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black54,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            const Text(
              'Carrito',
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              '${provider.cart.length} Productos',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Se eliminó todo del carrito',
                    style: TextStyle(fontSize: 18),
                  ),
                  duration: Duration(milliseconds: 1500),
                ));
                provider.eliminarTodo();
              },
              icon: const Icon(
                CupertinoIcons.delete,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: const BottomPanelCart(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: Colors.grey),
        itemCount: provider.cart.length,
        itemBuilder: (context, index) {
          final cartModel = provider.cart[index];
          final arreglo = cartModel.product.title!.split(' ').join('-');
          cartModel.product.heroId = 'cart-model-$arreglo';
          return ItemCart(
            cartModel: cartModel,
          );
        },
      ),
    );
  }
}
