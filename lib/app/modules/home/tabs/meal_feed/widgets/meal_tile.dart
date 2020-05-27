import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/not_rated_tile.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/rated_tile.dart';
import 'package:healthdiary/app/shared/utils/time_formatter.dart';
import 'package:shimmer/shimmer.dart';

class MealTile extends StatelessWidget {
  final card;

  const MealTile({Key key, this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(card['data'].toDate().toString());
    String message;

    if (card['comments'].length == 0) {
      message = 'Não há comentários';
    } else if (card['comments'].length == 1) {
      message = 'Ver comentário';
    } else {
      message = 'Ver todos os ${card['comments'].length} comentários';
    }

    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: Text(
                card['user']['nome'].substring(0, 2).toUpperCase(),
              ),
            ),
            title: Text(
              card['user']['nome'],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
                '${card['user']['idade']} anos, ${card['user']['peso']}kg.'),
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
                  child: CachedNetworkImage(
                    imageUrl: card['images'],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                              ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      child: Shimmer.fromColors(
                        direction: ShimmerDirection.rtl,
                        period: Duration(seconds: 5),
                        child: Container(
                          height: 250,
                          color: Colors.grey[400],
                        ),
                        baseColor: Colors.grey[400],
                        highlightColor: Colors.grey[100],
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                      card['type'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          card['rated']
              ? RatedTile(
                  calories: card['calories'],
                  prot: card['prot'],
                  carbs: card['carb'],
                  fat: card['fat'],
                  rating: card['rating'],
                )
              : NotRatedTile(),
          ListTile(
            title: Text(
              card['title'],
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
                  message,
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
