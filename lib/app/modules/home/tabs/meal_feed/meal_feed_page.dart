import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/check_updates_tile.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/loading_meal_tile.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/meal_tile.dart';
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
    controller.cardList = ObservableList();

    List cardList = await controller.loadMeals();

    controller.updated = false;

    setState(() => controller.cardList = cardList);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.cardList.length == 0) {
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

        if (controller.mealsList != null &&
            controller.reativeMealsList.data != null) {
          //se tem alguma meal nova, mostra que possui atualização

          if (controller.mealsList.length !=
              controller.reativeMealsList.data.length) {
            controller.updated = true;
          }
          //se existe algum prato que possui uma avaliação, mostra que possui atualizacao
          for (var meal in controller.mealsList) {
            for (var reativeMeal in controller.reativeMealsList.data) {
              if (meal.rated != reativeMeal.rated &&
                  meal.documentId == reativeMeal.documentId) {
                controller.updated = true;
              }
            }
          }
        }

        List list = controller.cardList;
        return RefreshIndicator(
          child: SafeArea(
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    index == 0 && controller.updated
                        ? CheckUpdatesTile(
                            onPressed: (bool pressed) {
                              if (pressed) {
                                _refreshPage();
                              }
                            },
                          )
                        : Container(),
                    MealTile(
                      card: list[index],
                      currentUser: controller.currentUser,
                      sendRate: controller.saveRate,
                    ),
                    index == list.length - 1
                        ? Column(
                            children: <Widget>[
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                  top: 20,
                                  bottom: 30,
                                  right: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 1,
                                      color: Colors.grey,
                                      width: 120,
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset(
                                          'assets/images/emptyPlate.png'),
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.grey,
                                      width: 120,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 30),
                                child: Center(
                                  child: Text('Você viu tudo 😮 '),
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 5,
                  color: Color(0xFFDDDDDD),
                );
              },
            ),
          ),
          onRefresh: _refreshPage,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
