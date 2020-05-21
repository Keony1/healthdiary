import 'package:flutter/material.dart';
import 'package:healthdiary/app/shared/models/Meal.dart';
import 'package:healthdiary/app/shared/models/User.dart';
import 'package:healthdiary/app/shared/utils/time_formatter.dart';
import 'package:healthdiary/app/shared/widgets/not_rated_tile.dart';
import 'package:healthdiary/app/shared/widgets/rated_tile.dart';

class MealTile extends StatelessWidget {
  final Meal meal;
  final User user;

  const MealTile({Key key, this.meal, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(meal.data.toDate().toString());

    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: Text(user.nome.substring(0, 2).toUpperCase()),
            ),
            title: Text(
              user.nome,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text('${user.idade} anos, ${user.peso}kg.'),
            trailing: Text(
              formatTime(date.toUtc().millisecondsSinceEpoch),
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.network(
                    meal.images,
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
                      meal.type,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          meal.rated
              ? RatedTile(
                  calories: meal.calories,
                  prot: meal.prot,
                  carbs: meal.carb,
                  fat: meal.fat,
                  rating: meal.rating,
                )
              : NotRatedTile(),
          ListTile(
            title: Text(
              meal.title,
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
