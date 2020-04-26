import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  String email = "";

  @observable
  String password = "";

  @action
  void setEmail(String value) {
    error = "";
    email = value;
  }

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isEmailValid => email.length >= 6;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @observable
  String error = "";

  @observable
  bool loading = false;

  @action
  Future<AuthStatus> login() async {
    loading = true;
    try {
      AuthStatus status = await auth.doLogin(email, password);
      if (status == AuthStatus.SUCCESS) {
        if (await auth.getPrevilegies() == 'client') {
          Modular.to.pushReplacementNamed("/client");
        } else {
          Modular.to.pushReplacementNamed("/admin");
        }
      }
      //faz alguma coisa pra quem não logou
    } catch (err) {
      error = err;
    }
  }
}
