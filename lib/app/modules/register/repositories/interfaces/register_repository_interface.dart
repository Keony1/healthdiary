import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/register/models/user_registration.dart';
import 'package:healthdiary/app/shared/models/User.dart';

abstract class IRegisterRepository implements Disposable {
  Future<User> createUser(UserRegistration user);
}
