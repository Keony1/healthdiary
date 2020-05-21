import 'package:flutter/material.dart';

class NotRatedTile extends StatelessWidget {
  const NotRatedTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        trailing: IconButton(
          onPressed: () {},
          tooltip: 'Aguardando avaliação',
          icon: Icon(
            Icons.timelapse,
          ),
        ),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) {
              return index < 0
                  ? Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  : Icon(
                      Icons.star_border,
                      color: Colors.grey.shade400,
                    );
            },
          ),
        ),
      ),
    );
  }
}
