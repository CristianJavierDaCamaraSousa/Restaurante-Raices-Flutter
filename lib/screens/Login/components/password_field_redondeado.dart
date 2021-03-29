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
        cursorColor: ColorPrimarioClaro,
        style: TextStyle(color: ColorPrimarioClaro),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: TextStyle(color: Colors.black26),
          icon: Icon(
            Icons.lock,
            color: ColorPrimarioClaro,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: ColorPrimarioClaro,
          ),
          errorStyle: TextStyle(color: ColorPrimarioClaro),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorPrimarioClaro)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
