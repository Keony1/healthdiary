import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  int _page = 0;
  Color _color = Colors.white;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigatorBar(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _appBar() {
    return AppBar(
      title: Text('Health Diary'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          color: Colors.white,
          onPressed: controller.logoff,
        ),
      ],
    );
  }

  _body() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _widgetPrato("assets/images/emptyPlate.png");
      },
    );
    ;
  }

  _bottomNavigatorBar() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      color: Colors.deepOrange[700],
      buttonBackgroundColor: Colors.deepOrange[700],
      backgroundColor: Colors.white,
      height: 50,
      animationDuration: Duration(
        milliseconds: 300,
      ),
      items: <Widget>[
        Icon(
          Icons.list,
          size: 20,
          color: _color,
        ),
        Icon(
          Icons.show_chart,
          size: 20,
          color: _color,
        ),
        Icon(
          Icons.add,
          size: 20,
          color: _color,
        ),
        Icon(
          Icons.chat,
          size: 20,
          color: _color,
        ),
        Icon(
          Icons.person,
          size: 20,
          color: _color,
        ),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
        //Handle button tap
      },
    );
  }

  _widgetPrato(String imgPath) {
    return Container(
        height: 130.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            _planetCard(),
            _planetThumbnail(),
          ],
        ));
  }

  _planetThumbnail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage("assets/images/emptyPlate.png"),
        height: 92.0,
        width: 92.0,
      ),
    );
  }

  _planetCard() {
    return Container(
      height: 200.0,
      margin: EdgeInsets.only(left: 40.0),
      decoration: BoxDecoration(
        color: Colors.deepOrange[300],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 160,
              ),
              height: 15.0,
              child: IconButton(
                onPressed: null,
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.timelapse),
                tooltip: 'Aguardando Avaliação',
              ),
            ),
            Text('Bom dia, começando a semana com muita proteína'),
            Container(height: 8.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Colors.deepOrange,
            ),
            Row(
              children: <Widget>[
                Text('4'),
                Container(width: 2.0),
                Icon(Icons.star),
                Container(width: 8.0),
                Text('2'),
                Container(width: 2.0),
                Icon(Icons.tag_faces),
                Container(width: 8.0),
                Text('34'),
                Container(width: 2.0),
                Icon(Icons.comment),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
