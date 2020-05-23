import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/enums/auth_status.dart';

class CheckStatusService extends Disposable {
  final AuthRepository authRepository;

  CheckStatusService({this.authRepository});

  Future<AuthStatus> execute() async {
    AuthStatus status;
    FirebaseUser user = await authRepository.checkAuthStatus();
    if (user != null) {
      status = AuthStatus.SUCCESS;
    } else {
      status = AuthStatus.FAIL;
    }

    return status;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
