import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/cart_provider.dart';
import 'package:prueba_tecnica/domain/models/cart_model.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: cartModel.product);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: cartModel.product.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                    width: 80,
                    height: 60,
                    fit: BoxFit.cover,
                    image: NetworkImage(cartModel.product.thumbnail.toString()),
                    placeholder: const AssetImage('assets/no-image.png')),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cartModel.product.title}',
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${cartModel.product.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 14),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    provider.eliminar(cartModel);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(
                      CupertinoIcons.minus,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${cartModel.cantidad}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    provider.adicionar(cartModel);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(
                      CupertinoIcons.plus,
                      size: 18,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    // return ListTile(
    //   // leading: ClipRRect(
    //   //   borderRadius: BorderRadius.circular(10),
    //   //   child: FadeInImage(
    //   //       image: NetworkImage(
    //   //           'https://www.shutterstock.com/image-photo/make-decision-which-way-go-600w-1348018796.jpg'),
    //   //       placeholder: AssetImage('assets/no-image.png')),
    //   // ),
    //   title: Text(
    //     'Title Emasdkja skdb kjas dkbja ksjdb kasdb kba skdb aksndb ',
    //     maxLines: 2,
    //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
    //   ),
    //   subtitle: Text(
    //     '\$857.99',
    //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
    //   ),
    //   trailing: Container(
    //     decoration:
    //         BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
    //     child: Icon(CupertinoIcons.plus),
    //   ),
    // );
  }
}
