import 'package:flutter/material.dart';
import 'package:restaurante_raices/screens/Login/components/text_field_container.dart';
import 'package:restaurante_raices/shared/components/constants.dart';

class PasswordFieldRedondeado extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;

  const PasswordFieldRedondeado({
    Key key,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: ColorPrimario,
        style: TextStyle(color: ColorPrimario),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: TextStyle(color: Colors.black26),
          icon: Icon(
            Icons.lock,
            color: ColorPrimario,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: ColorPrimario,
          ),
          errorStyle: TextStyle(color: ColorPrimario),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorPrimario)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
