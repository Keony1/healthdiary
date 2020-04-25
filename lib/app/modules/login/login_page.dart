import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/widgets/input_field.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  _body() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(),
        SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.free_breakfast,
                color: Colors.pinkAccent,
                size: 160,
              ),
              Observer(builder: (_) {
                return InputField(
                  icon: Icons.person_outline,
                  hint: "Login",
                  obscure: true,
                  onChanged: controller.setEmail,
                );
              }),
              Observer(builder: (_) {
                return InputField(
                  icon: Icons.lock_outline,
                  hint: "Senha",
                  obscure: true,
                  onChanged: controller.setPassword,
                );
              }),
              SizedBox(
                height: 32,
              ),
              Observer(builder: (_) {
                return SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.pinkAccent,
                    child: Text("Entrar"),
                    onPressed: controller.isFormValid ? controller.login : null,
                    textColor: Colors.white,
                    disabledColor: Colors.pinkAccent.withAlpha(140),
                  ),
                );
              })
            ],
          ),
        )),
      ],
    );
  }
}
