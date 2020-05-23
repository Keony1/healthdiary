import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/widgets/loading_meal_tile.dart';
import 'package:healthdiary/app/shared/widgets/meal_tile.dart';
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
    autorun((_) => controller.loadMeals());
    super.initState();
  }

  Future<Null> _refreshPage() async {
    setState(() => controller.mealsList = null);

    controller.loadMeals().then((mealsList) {
      setState(() => controller.mealsList = mealsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.mealsList != null) {
          return RefreshIndicator(
              child: ListView.separated(
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
              ),
              onRefresh: _refreshPage);
        } else {
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
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
