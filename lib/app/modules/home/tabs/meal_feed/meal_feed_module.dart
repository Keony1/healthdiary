import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/repository/meal_repository.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal/meal_controller.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_page.dart';

class MealFeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MealRepository()),
        Bind((i) => MealController()),
        Bind((i) => MealFeedController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MealFeedPage()),
      ];

  static Inject get to => Inject<MealFeedModule>.of();
}
