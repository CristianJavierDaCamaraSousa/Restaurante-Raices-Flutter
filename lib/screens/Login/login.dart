import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurante_raices/screens/Login/components/boton_redondeado.dart';
import 'package:restaurante_raices/screens/Login/components/input_field_redondeado.dart';
import 'package:restaurante_raices/screens/Login/components/password_field_redondeado.dart';
import 'package:restaurante_raices/services/get_it.dart';
import 'package:restaurante_raices/services/repository/usuario_repository.dart';
import 'package:restaurante_raices/shared/components/constants.dart';
import 'package:restaurante_raices/shared/components/loading.dart';
import 'package:restaurante_raices/shared/components/pantalla_fix.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  String password = "";

  String error = "";
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (!loading) {
      return PantallaFix(
        background: fondoBienvenida(),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                InputFieldRedondeado(
                  hintText: "Email",
                  validator: (value) => value.isEmpty ? "Ingresa un Email" : null,
                  onChanged: (value) => setState(() => email = value),
                ),
                PasswordFieldRedondeado(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingrese una contraseña";
                    } else if (value.length < 6) {
                      return "Contraseña debe tener +6 caracteres";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => setState(() => password = value),
                ),
                BotonRedondeado(
                  text: "LOGIN",
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await getIt.get<UsuarioRepository>().loginPruebaUsuarioUser();
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = "No se pudo realizar el Registro Correctamente";
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  error,
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return PantallaFix(
        background: fondoBienvenida(),
        children: [
          Loading(),
        ],
      );
    }
  }
}
