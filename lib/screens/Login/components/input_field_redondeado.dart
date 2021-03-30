import 'package:flutter/material.dart';
import 'package:restaurante_raices/screens/Login/components/text_field_container.dart';
import 'package:restaurante_raices/shared/components/constants.dart';

class InputFieldRedondeado extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;

  const InputFieldRedondeado({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorColor: ColorPrimario,
        style: TextStyle(color: ColorPrimario),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorPrimario,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black26),
          errorStyle: TextStyle(color: ColorPrimario),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorPrimario)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
