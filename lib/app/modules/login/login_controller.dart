import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController _auth = Modular.get();

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

  @observable
  Map user;

  @observable
  AuthStatus status;

  @action
  autoLogin() async {
    loading = true;
    await _auth.checkStatus();
    status = await _auth.getStatus();
    pushPage(status);
  }

  @action
  pushPage(status) async {
    if (status == AuthStatus.SUCCESS) {
      Map user = await _auth.getUserData();

      if (user['role'] == 'client') {
        Modular.to.pushNamed("/client", arguments: user);
      } else {
        Modular.to.pushReplacementNamed("/admin",
            arguments: user); // TODO CRIAR MODEL USER
      }
    } else if (status == AuthStatus.FAIL) {
      await Future.delayed(Duration(seconds: 1));
      loading = false;
    }
  }

  @action
  Future login() async {
    loading = true;
    try {
      status = await _auth.doLogin(email, password);
      pushPage(status);
    } catch (_) {
      loading = false;
      error = "Usuário ou senha incorretos";
    }
  }
}
