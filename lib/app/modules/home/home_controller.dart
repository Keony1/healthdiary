import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  logoff() async {
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed("/");
  }
}
