import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  String email = "";

  @observable
  String password = "";

  bool tapEmail = false;

  bool tapPassword = false;

  @action
  void setEmail(String value) {
    error = "";
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void isTappedEmail() {
    tapEmail = true;
  }

  @action
  void isTappedPassword() {
    tapPassword = true;
  }

  @computed
  bool get isEmailValid => email.length >= 4;

  @computed
  bool get isPasswordValid => password.length >= 4;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  String get errorEmail => email.length > 0 && email.length < 4
      ? "Seu login deve ser maior que 3 caracteres"
      : null;

  @computed
  String get errorPassword => password.length > 0 && password.length < 4
      ? "Sua senha deve ser maior que 3 caracteres"
      : null;

  @observable
  String error = "";

  @observable
  bool loading = false;

  @action
  login() async {
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
      print(err);
      //   error = err;
    }
  }
}
