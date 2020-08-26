import 'package:flutter/material.dart';
import 'package:healthdiary/app/shared/animations/fade_animation.dart';
import 'package:healthdiary/app/shared/widgets/input_field.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/widgets/date_input_field.dart';
import 'register_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      // body: Container(),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          colors: [
            Color.fromRGBO(248, 80, 50, 0.8),
            Color.fromRGBO(231, 56, 39, 0.8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Column(
            children: <Widget>[
              FadeAnimation(
                1,
                Text(
                  "Health Diary",
                  style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      FadeAnimation(
                          1.4,
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Observer(builder: (_) {
                                  return ListTile(
                                    leading: Icon(Icons.person_outline),
                                    title: InputField(
                                      hint: "Nome",
                                      // onChanged: controller.setEmail,
                                      // errorText: controller.errorEmail,
                                      // onTap: controller.isTappedEmail,
                                    ),
                                  );
                                }),
                                SizedBox(
                                  height: 10,
                                ),
                                Observer(builder: (_) {
                                  return ListTile(
                                    leading: Icon(Icons.lock_outline),
                                    title: InputField(
                                      hint: "Senha",
                                      obscure: true,
                                      // onChanged: controller.setPassword,
                                      // errorText: controller.errorPassword,
                                      // onTap: controller.isTappedPassword,
                                    ),
                                  );
                                }),
                                Observer(
                                  builder: (_) {
                                    return ListTile(
                                        leading: Icon(Icons.person_outline),
                                        title: DateInputField());
                                  },
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.6,
                        Observer(builder: (_) {
                          return SizedBox(
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              color: Color.fromRGBO(248, 80, 50, 0.8),
                              child: Text("Entrar"),
                              onPressed: () {},
                              textColor: Colors.white,
                              disabledColor: Color.fromRGBO(248, 80, 50, 0.5),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
