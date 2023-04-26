import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/data/repository/productos_repository_impl.dart';
import 'package:prueba_tecnica/domain/repository/productos_repository.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.I;

Future<void> initializeDI() async {
  await _data();
  // await _domain();
  // await _view();
}

Future<void> _data() async {
  getIt
      .registerSingleton<ProductosRepository>(ProductosRepoImpl(http.Client()));
}

// Future<void> _domain() async {}
// Future<void> _view() async {}
