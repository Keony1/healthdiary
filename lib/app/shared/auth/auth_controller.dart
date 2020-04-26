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
  var user;

  @action
  Future<AuthStatus> doLogin(String newEmail, String newPassword) async {
    String completedEmail = newEmail + '@healthdiary.com.br';
    var user = await _repository.getLoginWithEmailAndPassword(
        completedEmail, newPassword);

    print(user);
    if (user != null) {
      return AuthStatus.SUCCESS;
    }

    return AuthStatus.FAIL;
  }

  Future getPrevilegies() async {
    Map userData = await _repository.getUser();
    return userData['role'];
  }

  @action
  Future logOut() {
    return _repository.getLogOut();
  }
}

enum AuthStatus { IDLE, LOADING, SUCCESS, FAIL }
