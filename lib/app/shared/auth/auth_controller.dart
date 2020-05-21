import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:healthdiary/app/shared/models/User.dart';
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
    try {
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
    } catch (error) {
      rethrow;
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
  Future<User> getUser() async {
    Map userData = await _repository.getCurrentUser();

    User user = User.fromJson(userData);

    return user;
  }

  @action
  Future<List<User>> getAllUsers() async {
    QuerySnapshot usersDocuments = await _repository.getDocumentsUser();

    List<User> users =
        usersDocuments.documents.map((doc) => User.fromJson(doc.data)).toList();

    return users;
  }

  @action
  Future logOut() {
    return _repository.getLogOut();
  }
}

enum AuthStatus { IDLE, LOADING, SUCCESS, FAIL }
