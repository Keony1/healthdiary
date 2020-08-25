import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthdiary/app/modules/add_meal/add_meal_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/add_meal/add_meal_page.dart';
import 'package:healthdiary/app/shared/auth/repositories/auth_repository.dart';
import 'package:healthdiary/app/shared/auth/services/firebase/get_current_user_service.dart';
import 'package:healthdiary/app/shared/meal/repository/meals_repository.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/upload_meal_image_service.dart';
import 'package:healthdiary/app/shared/meal/services/firebase/upload_meal_service.dart';

class AddMealModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddMealController(
              getCurrentUser: i.get<GetCurrentUserService>(),
              uploadImageMeal: i.get<UploadMealImageService>(),
              uploadMeal: i.get<UploadMealService>(),
            )),
        Bind(
          (i) => AuthRepository(
            firebaseAuth: FirebaseAuth.instance,
            firestore: Firestore.instance,
          ),
        ),
        Bind(
          (i) => MealsRepository(firestore: Firestore.instance),
        ),
        Bind(
          (i) => UploadMealImageService(
            mealsRepository: i.get<MealsRepository>(),
          ),
        ),
        Bind(
          (i) => GetCurrentUserService(
            authRepository: i.get<AuthRepository>(),
          ),
        ),
        Bind(
          (i) => UploadMealService(
            mealsRepository: i.get<MealsRepository>(),
          ),
        )
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AddMealPage(imageCamera: args.data)),
      ];

  static Inject get to => Inject<AddMealModule>.of();
}
