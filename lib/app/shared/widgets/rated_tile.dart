import 'package:flutter/material.dart';

class RatedTile extends StatelessWidget {
  final double rating;
  final double carbs;
  final double prot;
  final double fat;
  final double calories;

  const RatedTile(
      {Key key, this.rating, this.carbs, this.calories, this.fat, this.prot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        leading: RawMaterialButton(
          onPressed: () {},
          elevation: 1.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) {
                return index < rating
                    ? Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      )
                    : Icon(
                        Icons.star_border,
                        color: Colors.grey.shade400,
                      );
              },
            ),
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
    );
  }
}
