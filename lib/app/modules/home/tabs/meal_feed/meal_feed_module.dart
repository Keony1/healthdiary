import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/repository/meal_repository.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/meal_controller.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_page.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository_interface.dart';

import 'meal/repository/meal_repository_interface.dart';

class MealFeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMealRepository>((i) => MealRepository()),
        Bind((i) => MealController()),
        Bind((i) => MealFeedController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MealFeedPage()),
      ];

  static Inject get to => Inject<MealFeedModule>.of();
}
