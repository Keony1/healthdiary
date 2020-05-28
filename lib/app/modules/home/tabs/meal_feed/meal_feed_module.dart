import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_page.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/repository/meals_repository.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_meals_service.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/services/firebase/get_reative_meals_service.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_all_users_service.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';

class MealFeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => AuthRepository(
              firestore: Firestore.instance,
              firebaseAuth: FirebaseAuth.instance),
        ),
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
          (i) => GetMealsService(
            mealsRepository: i.get<MealsRepository>(),
          ),
        ),
        Bind(
          (i) => GetReativeMealsService(
            mealsRepository: i.get<MealsRepository>(),
          ),
        ),
        Bind(
          (i) => GetAllUsersService(
            authRepository: i.get<AuthRepository>(),
          ),
        ),
        Bind(
          (i) => MealFeedController(
              getMealsService: i.get<GetMealsService>(),
              getCurrentUserService: i.get<GetCurrentUserService>(),
              getReativeMealsService: i.get<GetReativeMealsService>(),
              getAllUsersService: i.get<GetAllUsersService>()),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MealFeedPage()),
      ];

  static Inject get to => Inject<MealFeedModule>.of();
}
