import 'package:flutter/material.dart';
import 'package:restaurante_raices/services/get_it.dart';

import 'services/database.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() async {
                  info = await getIt.get<Database>().impresionPrueba();
                });
              },
              child: Text("Counsulta"),
            ),
          ],
        ),
      ),
    );
  }
}
