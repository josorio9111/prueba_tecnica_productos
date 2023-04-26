import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/cart_provider.dart';

class BottomPanelCart extends StatelessWidget {
  const BottomPanelCart({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Container(
        padding: const EdgeInsets.all(20),
        height: 150,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.doc_chart_fill,
                  color: Colors.orange.shade700,
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total'),
                    const SizedBox(height: 5),
                    Text(
                      '\$${provider.total}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange.shade500,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: const [
                    Text(
                      'Cupón de descuento',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minWidth: 200,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: Colors.teal.shade600,
                    onPressed: () {},
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))
              ],
            )
          ],
        ));
  }
}
