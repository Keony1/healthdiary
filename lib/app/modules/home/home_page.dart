import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:healthdiary/app/shared/animations/fade_animation.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with AutomaticKeepAliveClientMixin {
  //use 'controller' variable to access controller
  PageController _pageController;
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomNavigatorBar(),
    );
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _body() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.red[900],
        Colors.red[600],
        Colors.red[400],
      ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    "Olá Antonio,",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  1,
                  Text(
                    "O que você está comendo agora?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0),
                ),
              ),
              child: Container(),
            ),
          )
        ],
      ),
    );
  }

  _floatingActionButton() {
    return SpeedDial(
      child: Icon(Icons.add),
      backgroundColor: Colors.red,
      overlayOpacity: 0.4,
      overlayColor: Colors.black,
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.camera_alt,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
            label: "Enviar foto do prato",
            labelStyle: TextStyle(fontSize: 14),
            onTap: () {})
      ],
    );
  }

  _bottomNavigatorBar() {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.red,
        primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white54),
            ),
      ),
      child: BottomNavigationBar(
        currentIndex: _page,
        onTap: (p) {
          _pageController.animateToPage(p,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.ease);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Dados"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Início"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text("Evoluções"),
          ),
        ],
      ),
    );
  }

  _widgetPrato(String imgPath) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Row(children: [
              Hero(
                  tag: imgPath,
                  child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0)),
              SizedBox(width: 10.0),
            ])),
            IconButton(
                icon: Icon(Icons.camera_enhance),
                color: Colors.black,
                onPressed: () {})
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
