import 'package:flutter/material.dart';
import 'package:healthdiary/app/shared/widgets/smooth_start_rating.dart';

class MealTile extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;
  final String type;

  MealTile({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.rating,
    @required this.raters,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.0,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 5.0,
                bottom: 270.0,
                child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '$type',
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    )),
              ),
              Positioned(
                right: -10.0,
                bottom: 270.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  elevation: 4.0,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.timelapse,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, left: 10),
            child: Text(
              "$name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 5.0,
              top: 2.0,
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('30'),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(right: 20),
                      icon: Image.asset(
                        'assets/images/bolt.png',
                        width: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('30'),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(right: 20),
                      icon: Image.asset(
                        'assets/images/fish.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('30'),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(right: 20),
                      icon: Image.asset(
                        'assets/images/sausage.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                ),
                Text('Calorias: 540kcal')
              ],
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
