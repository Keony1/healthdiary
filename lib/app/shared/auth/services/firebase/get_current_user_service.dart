import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/models/User.dart';

class GetCurrentUserService extends Disposable {
  final AuthRepository authRepository;

  GetCurrentUserService({@required this.authRepository});

  Future<User> execute() async {
    User user = await authRepository.getCurrentUser();

    return user;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
