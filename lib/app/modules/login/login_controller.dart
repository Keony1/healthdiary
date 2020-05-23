import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/check_status_service.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/login_service.dart';
import 'package:mobx/mobx.dart';
import 'package:healthdiary/app/shared/enums/auth_status.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginService loginService;
  final CheckStatusService checkStatusService;

  _LoginControllerBase({this.loginService, this.checkStatusService});

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

    status = await checkStatusService.execute();

    pushPage(status);
  }

  @action
  pushPage(status) async {
    if (status == AuthStatus.SUCCESS) {
      Modular.to.pushReplacementNamed("/home");
    } else if (status == AuthStatus.FAIL) {
      await Future.delayed(Duration(seconds: 1));
      loading = false;
    }
  }

  @action
  Future login() async {
    loading = true;
    try {
      status = await loginService.execute(
        newEmail: email,
        newPassword: password,
      );
      pushPage(status);
    } catch (_) {
      loading = false;
      email = "";
      password = "";
      error = "Usuário ou senha incorretos";
    }
  }
}
