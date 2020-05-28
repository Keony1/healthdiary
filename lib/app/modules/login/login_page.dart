import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/animations/fade_animation.dart';
import 'package:healthdiary/app/shared/widgets/input_field.dart';
import 'package:healthdiary/app/shared/widgets/splash_page.dart';
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
  void initState() {
    autorun((_) => controller.autoLogin());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (controller.loading) {
          return SplashPage();
        } else {
          return _body();
        }
      }),
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
            height: 90,
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
            height: 80,
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
                                      hint: "Login",
                                      onChanged: controller.setEmail,
                                      errorText: controller.errorEmail,
                                      onTap: controller.isTappedEmail,
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
                                      onChanged: controller.setPassword,
                                      errorText: controller.errorPassword,
                                      onTap: controller.isTappedPassword,
                                    ),
                                  );
                                }),
                                Observer(
                                  builder: (_) {
                                    if (controller.error != null) {
                                      return Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Center(child: Text(controller.error)),
                                        ],
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 40,
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
                              onPressed: controller.isFormValid
                                  ? controller.login
                                  : null,
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
