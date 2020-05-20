import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/widgets/meal_tile.dart';
import 'package:mobx/mobx.dart';
import 'meal_feed_controller.dart';

class MealFeedPage extends StatefulWidget {
  final String title;
  final Map userModel;

  const MealFeedPage({Key key, this.title = "MealFeed", this.userModel})
      : super(key: key);

  @override
  _MealFeedPageState createState() => _MealFeedPageState();
}

class _MealFeedPageState
    extends ModularState<MealFeedPage, MealFeedController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    autorun((_) => controller.getMeals(widget.userModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return MealTile(
          img: 'assets/images/teste.jpg',
          isFav: false,
          type: 'Café da Manhã',
          name: 'Almoço muito bom hojeee banana de pijamas subindo as escadas',
          raters: 2,
          rating: 4.0,
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}
