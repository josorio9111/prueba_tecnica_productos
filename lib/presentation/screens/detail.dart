import 'package:flutter/material.dart';
import 'package:prueba_tecnica/domain/models/productos_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(product),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(product),
          _Overview(product),
          _Overview(product),
          _Overview(product),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text('Otras imagenes', style: textTheme.titleLarge)),
          _Carousel(product),
          const SizedBox(height: 50),
        ]))
      ],
    ));
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.25,
        viewportFraction: .6,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: product.images!.map((e) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.png'),
              image: NetworkImage(e),
              fit: BoxFit.cover,
            ));
      }).toList(),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Product product;

  const _CustomAppBar(this.product);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: BackButton(
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      stretch: true,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            product.title!,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/no-image.png'),
          image: NetworkImage(product.thumbnail!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Product product;

  const _PosterAndTitle(this.product);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: product.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.png'),
                image: NetworkImage(product.thumbnail!),
                height: 120,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title!,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text(product.description!,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('${product.rating}', style: textTheme.bodyText2)
                  ],
                ),
                Text('\$${product.price}', style: textTheme.titleLarge)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Product product;

  const _Overview(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        product.description!,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
