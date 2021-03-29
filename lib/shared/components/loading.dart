import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitCircle(
          duration: Duration(seconds: 2),
          color: Color(0x99111111),
          size: 80.0,
        ),
      ),
    );
  }
}
