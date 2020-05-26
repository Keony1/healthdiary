import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_page.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/meals_repository.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_meals.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_reative_meals.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';

class MealFeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => GetCurrentUserService(
            authRepository: AuthRepository(
              firestore: Firestore.instance,
            ),
          ),
        ),
        Bind(
          (i) => MealsRepository(firestore: Firestore.instance),
        ),
        Bind(
          (i) => GetMeals(
            mealsRepository: i.get<MealsRepository>(),
          ),
        ),
        Bind(
          (i) => GetReativeMeals(
            mealsRepository: i.get<MealsRepository>(),
          ),
        ),
        Bind(
          (i) => MealFeedController(
            getMeals: i.get<GetMeals>(),
            getCurrentUserService: i.get<GetCurrentUserService>(),
            getReativeMeals: i.get<GetReativeMeals>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MealFeedPage()),
      ];

  static Inject get to => Inject<MealFeedModule>.of();
}
