import 'package:flutter/material.dart';
import 'package:restaurante_raices/shared/components/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.maybeOf(context);
    Size size = mq.size ?? 0;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: ColorSecundario,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
