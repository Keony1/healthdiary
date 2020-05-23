import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/enums/auth_status.dart';
import 'package:healthdiary/app/shared/models/User.dart';

class LoginService extends Disposable {
  final AuthRepository authRepository;

  LoginService({this.authRepository});

  Future<AuthStatus> execute({
    @required String newEmail,
    @required newPassword,
  }) async {
    AuthStatus status;
    String completedEmail = newEmail + '@healthdiary.com.br';

    try {
      User user = await authRepository.getLoginWithEmailAndPassword(
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

  //dispose will be called automatically

  @override
  void dispose() {}
}
