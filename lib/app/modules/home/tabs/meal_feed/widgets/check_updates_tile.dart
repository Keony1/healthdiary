import 'package:flutter/material.dart';

class CheckUpdatesTile extends StatelessWidget {
  const CheckUpdatesTile({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        onPressed: () {
          onPressed(true);
        },
        fillColor: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            'Há novas atualizações',
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
