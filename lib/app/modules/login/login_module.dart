import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthdiary/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/login/login_page.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/auth/repositories/interface/auth_repository_interface.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/check_status_service.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/login_service.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => LoginController(
            loginService: i.get<LoginService>(),
            checkStatusService: i.get<CheckStatusService>(),
          ),
        ),
        Bind(
          (i) => LoginService(
            authRepository: i.get<AuthRepository>(),
          ),
        ),
        Bind(
          (i) => CheckStatusService(
            authRepository: i.get<AuthRepository>(),
          ),
        ),
        Bind(
          (i) => GetCurrentUserService(
            authRepository: i.get<AuthRepository>(),
          ),
        ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(
            firebaseAuth: FirebaseAuth.instance,
            firestore: Firestore.instance,
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
