import 'register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/register/repositories/register_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => RegisterController(
            registerRepository: i(),
          ),
        ),
        Bind((i) => RegisterRepository(firebaseAuth: FirebaseAuth.instance))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
