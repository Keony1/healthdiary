import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_module.dart';
import 'package:healthdiary/app/modules/home/widgets/custom_circle_bottom_navigation.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with AutomaticKeepAliveClientMixin {
  int _page = 0;

  final pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: PageView(
        controller: pageController,
        children: [
          RouterOutlet(
            module: MealFeedModule(),
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: _circleBottomNavigation(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Health Diary',
        style: TextStyle(fontFamily: 'DancingScript', fontSize: 30),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          color: Colors.redAccent,
          onPressed: controller.logoff,
        ),
      ],
    );
  }

  _circleBottomNavigation() {
    return CustomCircleBottomNavigation(
      initialSelection: _page,
      circleColor: Colors.redAccent,
      indexWithNoAnimation: 2,
      textColor: Colors.redAccent,
      inactiveIconColor: Colors.redAccent,
      tabs: [
        TabData(icon: Icons.home),
        TabData(icon: Icons.show_chart),
        TabData(icon: Icons.add),
        TabData(icon: Icons.chat),
        TabData(icon: Icons.person),
      ],
      onTabChangedListener: (index) async {
        switch (index) {
          case 2:
            controller.pushToAddMealPage();
            break;
          default:
            pageController.animateToPage(
              index,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.ease,
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
