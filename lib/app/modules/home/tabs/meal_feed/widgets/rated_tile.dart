import 'package:flutter/material.dart';

class RatedTile extends StatelessWidget {
  final int rating;
  final int carbs;
  final int prot;
  final int fat;
  final int calories;

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
                  carbs.toString(),
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
                  prot.toString(),
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
                  fat.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        trailing: Text(
          '${calories.toString()} kcal',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
