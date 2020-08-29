import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/register/models/user_registration.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'interfaces/register_repository_interface.dart';

@Injectable()
class RegisterRepository implements IRegisterRepository {
  final FirebaseAuth firebaseAuth;

  RegisterRepository({this.firebaseAuth});

  @override
  Future<User> createUser(UserRegistration user) async {
    AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    return User(
        idade: 10, nome: 'keony', onesignalId: '1', peso: 10, role: 'a');
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
