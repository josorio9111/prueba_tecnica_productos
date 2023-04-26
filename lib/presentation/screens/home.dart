import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/categorias_provider.dart';
import 'package:prueba_tecnica/data/providers/productos_providers.dart';
import 'package:prueba_tecnica/presentation/widgets/app_bar_home.dart';
import 'package:prueba_tecnica/presentation/widgets/list_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                    bottom:
                        BorderSide(color: Colors.grey.shade400, width: 1.5)),
              ),
              child: const AppBarHome(),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListaProductos(
                    products: provider.productos,
                    nextProductos: () {
                      final providerC = Provider.of<CategoriasProvider>(context,
                          listen: false);
                      return providerC.nombreActivo == 'Todos' ||
                              providerC.nombreActivo == ''
                          ? provider.getProductos()
                          : null;
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
