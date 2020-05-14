import 'package:flutter/material.dart';

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
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: Text('AN'),
            ),
            title: Text(
              'Antônio',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text('25 anos, 80kg.'),
            trailing: Text(
              '12:32',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
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
                  top: 10.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.redAccent,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '$type',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          ListTile(
            leading: RawMaterialButton(
              onPressed: () {},
              elevation: 1.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/bolt.png',
                      width: 10,
                    ),
                    Text(
                      '3005',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/fish.png',
                      width: 15,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '3005',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/sausage.png',
                      width: 15,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '3005',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Text(
              '4000 kcal',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            title: Text(
              "$name",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ver todos os 20 comentários',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
