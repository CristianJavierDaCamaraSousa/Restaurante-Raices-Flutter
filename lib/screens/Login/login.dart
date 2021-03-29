import 'package:flutter/material.dart';
/*
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
                      dynamic result = await AuthService().signInEmailPassword(email, password);
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
                SizedBox(height: size.height * 0.02),
                YaTengoUnaCuenta(
                  press: () => Navigator.pushReplacementNamed(context, '/SignUp'),
                ),
                Division(text: "O"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return PantallaFix(
        background: fondoBienvenida(),
        children: [Loading()],
      );
    }
  }
}
*/
