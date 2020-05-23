import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class LoadingMealTile extends StatelessWidget {
  const LoadingMealTile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Shimmer.fromColors(
            direction: ShimmerDirection.rtl,
            period: Duration(seconds: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[400],
              ),
              title: Container(
                height: 10,
                color: Colors.grey[400],
              ),
              subtitle: Container(
                height: 10,
                color: Colors.grey[400],
              ),
            ),
            baseColor: Colors.grey[400],
            highlightColor: Colors.grey[100],
          ),
        ),
        Container(
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
        Container(
          child: Shimmer.fromColors(
            direction: ShimmerDirection.rtl,
            period: Duration(seconds: 5),
            child: ListTile(
              title: Container(
                height: 10,
                color: Colors.grey[400],
              ),
              subtitle: Container(
                height: 10,
                color: Colors.grey[400],
              ),
            ),
            baseColor: Colors.grey[400],
            highlightColor: Colors.grey[100],
          ),
        ),
      ],
    );
  }
}
