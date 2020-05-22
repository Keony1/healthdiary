import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:healthdiary/app/shared/widgets/meal_tile.dart';
import 'package:mobx/mobx.dart';
import 'meal_feed_controller.dart';

class MealFeedPage extends StatefulWidget {
  final String title;

  const MealFeedPage({Key key, this.title = "MealFeed"}) : super(key: key);

  @override
  _MealFeedPageState createState() => _MealFeedPageState();
}

class _MealFeedPageState
    extends ModularState<MealFeedPage, MealFeedController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    autorun((_) => controller.loadMeals());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.mealsList != null) {
        return ListView.separated(
          itemCount: controller.mealsList.length,
          itemBuilder: (BuildContext context, int index) {
            return MealTile(
              meal: controller.mealsList[index],
              user: controller.currentUser,
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 5,
              color: Color(0xFFDDDDDD),
            );
          },
        );
      } else {
        return Container();
      }
    });
  }
}
