import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_page.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/interfaces/meals_repository_interface.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/meals_repository.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_meals_by_id_service.dart';
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
        Bind<IMealsRepository>(
          (i) => MealsRepository(
            firestore: Firestore.instance,
          ),
        ),
        Bind(
          (i) => GetMealByIdService(
            mealsRepository: i.get<MealsRepository>(),
          ),
        ),
        Bind(
          (i) => MealFeedController(
            getMealByIdService: i.get<GetMealByIdService>(),
            getCurrentUserService: i.get<GetCurrentUserService>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MealFeedPage()),
      ];

  static Inject get to => Inject<MealFeedModule>.of();
}
