import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';

class LogoutService extends Disposable {
  final AuthRepository authRepository;

  LogoutService({this.authRepository});

  Future<void> execute() async {
    return authRepository.getLogOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
