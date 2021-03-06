import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/not_rated_tile.dart';
import 'package:healthdiary/app/modules/home/tabs/meal_feed/widgets/rated_tile.dart';
import 'package:healthdiary/app/shared/utils/time_formatter.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shimmer/shimmer.dart';

class MealTile extends StatelessWidget {
  final card;
  final currentUser;
  final Function sendRate;

  const MealTile({Key key, this.card, this.currentUser, this.sendRate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(card);

    var date = DateTime.parse(card['data'].toDate().toString());
    String message;

    if (card['comments'].length == 0) {
      message = 'Não há comentários';
    } else if (card['comments'].length == 1) {
      message = 'Ver comentário';
    } else {
      message = 'Ver todos os ${card['comments'].length} comentários';
    }

    void _showDialog() {
      showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: 100,
              child: Image.asset('assets/images/platefood.png'),
            ), // set your own image/icon widget
            title: "Avaliação de prato",
            description:
                "Sua nota é muito importante para a satisfação dos usuários.",
            submitButton: "Enviar",

            accentColor: Colors.red, // optional
            onSubmitPressed: (int rating) {
              print("onSubmitPressed: rating = $rating");
              sendRate(rating, card['documentId']);
              // TODO: open the app's page on Google Play / Apple App Store
            },
            onAlternativePressed: () {
              print("onAlternativePressed: do something");
              // TODO: maybe you want the user to contact you instead of rating a bad review
            },
          );
        },
      );
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
                  rating: card['rating'],
                  nutriName: card['nutriName'],
                )
              : currentUser.role == 'admin'
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: FlatButton(
                        color: Colors.redAccent,
                        onPressed: _showDialog,
                        child: Text(
                          'Avaliar prato',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
