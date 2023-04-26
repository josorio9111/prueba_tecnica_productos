import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/data/providers/cart_provider.dart';
import 'package:prueba_tecnica/data/providers/categorias_provider.dart';
import 'package:prueba_tecnica/data/providers/productos_providers.dart';
import 'package:prueba_tecnica/di/Locator.dart';
import 'package:prueba_tecnica/presentation/screens/cart.dart';
import 'package:prueba_tecnica/presentation/screens/detail.dart';
import 'package:prueba_tecnica/presentation/screens/home.dart';

void main() async {
  await initializeDI();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductosProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => CartProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => CategoriasProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'cart': (_) => const CartPage(),
        'detail': (_) => const DetailPage(),
      },
    );
  }
}
