import 'package:flutter/material.dart';

class RatedTile extends StatelessWidget {
  final int rating;

  const RatedTile({Key key, this.rating}) : super(key: key);

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
        trailing: Text(
          'Avaliado por Paulo',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
