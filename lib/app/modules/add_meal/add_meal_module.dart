import 'package:healthdiary/app/modules/add_meal/add_meal_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/add_meal/add_meal_page.dart';

class AddMealModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AddMealController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => AddMealPage(imageCamera: args.data)),
      ];

  static Inject get to => Inject<AddMealModule>.of();
}
