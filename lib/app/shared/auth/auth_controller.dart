import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _repository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.LOADING;

  @observable
  dynamic user;

  @action
  Future<AuthStatus> doLogin(String newEmail, String newPassword) async {
    String completedEmail = newEmail + '@healthdiary.com.br';

    user = await _repository.getLoginWithEmailAndPassword(
        completedEmail, newPassword);

    if (user != null) {
      status = AuthStatus.SUCCESS;
      return status;
    } else {
      status = AuthStatus.FAIL;
      return status;
    }
  }

  @action
  checkStatus() async {
    user = await _repository.checkAuthStatus();
    if (user != null) {
      status = AuthStatus.SUCCESS;
    } else {
      status = AuthStatus.FAIL;
    }
  }

  @action
  Future getStatus() async {
    return status;
  }

  @action
  Future getUserData() async {
    Map userData = await _repository.getUser();
    return userData;
  }

  @action
  Future logOut() {
    return _repository.getLogOut();
  }
}

enum AuthStatus { IDLE, LOADING, SUCCESS, FAIL }
