import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_raices/models/plantilla_autenticacion.dart';
import 'package:restaurante_raices/screens/Principal/pantalla_meseros/pantalla_meseros.dart';
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
        StreamProvider(
          create: (_) => getIt.get<UsuarioRepository>().streamLogeado,
          initialData: LogeadoPOJO(false),
        ),
        StreamProvider(
          create: (_) => getIt.get<UsuarioRepository>().streamToken,
          initialData: TokenPOJO("Bearer "),
        ),
      ],
      child: MaterialApp(
        title: 'Restaurante Raices',
        theme: ThemeData.light(),
        //home: Wrapper(),
        home: PantallaMesero(),
      ),
    );
  }
}
