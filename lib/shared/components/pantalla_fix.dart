import 'package:flutter/material.dart';

class PantallaFix extends StatelessWidget {
  final List<Widget> children;
  final Widget background;

  const PantallaFix({
    @required this.background,
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          background,
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
