import 'package:healthdiary/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:healthdiary/app/app_widget.dart';
import 'package:healthdiary/app/modules/add_meal/add_meal_module.dart';
import 'package:healthdiary/app/modules/home/home_module.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/add_meal', module: AddMealModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
