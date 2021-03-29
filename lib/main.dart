import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_raices/screens/Principal/pagina_ejemplo.dart';
import 'package:restaurante_raices/services/get_it.dart';
import 'package:restaurante_raices/services/repository/usuario_repository.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //getIt.get<StreamProvider<String>>(),
        StreamProvider(
          create: (_) => getIt.get<UsuarioRepository>().streamMensajes,
          initialData: "",
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PaginaEjemplo(),
      ),
    );
  }
}
