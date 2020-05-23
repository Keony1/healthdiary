import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/logout_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LogoutService logoutService;

  _HomeControllerBase({@required this.logoutService});

  @action
  logoff() async {
    await logoutService.execute();
    Modular.to.pushReplacementNamed("/");
  }
}
