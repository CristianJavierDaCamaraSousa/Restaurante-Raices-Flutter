import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurante_raices/shared/components/constants.dart';

class PantallaOpciones extends StatelessWidget {
  List<Widget> pestanas;
  List<Widget> pantallas;

  PantallaOpciones({@required this.pestanas, @required this.pantallas});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.maybeOf(context);
    Size size = mq.size ?? 0;

    return MaterialApp(
      home: DefaultTabController(
        length: pestanas.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(234, 190, 63, 100),
            bottom: TabBar(
              tabs: pestanas,
            ),
            centerTitle: true,
            title: SvgPicture.asset(
              "icons/Logo_raices.svg",
              height: size.height * 0.1,
            ),
            toolbarHeight: 150,
          ),
          body: TabBarView(
            children: pantallas,
          ),
        ),
      ),
    );
  }
}
