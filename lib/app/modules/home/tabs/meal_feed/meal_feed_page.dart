import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/loading_meal_tile.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/meal_tile.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:mobx/mobx.dart';
import 'meal_feed_controller.dart';

class MealFeedPage extends StatefulWidget {
  final String title;

  const MealFeedPage({Key key, this.title = "MealFeed"}) : super(key: key);

  @override
  _MealFeedPageState createState() => _MealFeedPageState();
}

class _MealFeedPageState extends ModularState<MealFeedPage, MealFeedController>
    with AutomaticKeepAliveClientMixin<MealFeedPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<Null> _refreshPage() async {
    // setState(() => controller.mealsList = null);

    // controller.loadMeals().then((mealsList) {
    //   setState(() => controller.mealsList = mealsList);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.mealsList == null) {
          return ListView.separated(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return LoadingMealTile();
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 5,
                color: Color(0xFFDDDDDD),
              );
            },
          );
        }

        List<Meal> list = controller.mealsList;

        return RefreshIndicator(
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return MealTile(
                meal: list[index],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 5,
                color: Color(0xFFDDDDDD),
              );
            },
          ),
          onRefresh: _refreshPage,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
