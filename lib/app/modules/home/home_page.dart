import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/meal_feed_module.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Map userModel;
  const HomePage({Key key, this.title = "Home", this.userModel})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with AutomaticKeepAliveClientMixin {
  int _page = 0;

  List _widgetPages = [
    RouterOutlet(
      module: MealFeedModule(),
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _widgetPages[_page],
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
    return CircleBottomNavigation(
      initialSelection: _page,
      circleColor: Colors.redAccent,
      textColor: Colors.redAccent,
      inactiveIconColor: Colors.redAccent,
      tabs: [
        TabData(icon: Icons.home),
        TabData(icon: Icons.show_chart),
        TabData(icon: Icons.add_circle_outline),
        TabData(icon: Icons.chat),
        TabData(icon: Icons.person),
      ],
      onTabChangedListener: (index) => setState(
        () => _page = index,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
