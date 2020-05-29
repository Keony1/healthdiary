import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:healthdiary/app/shared/widgets/input_field.dart';
import 'package:healthdiary/app/shared/widgets/splash_page.dart';
import 'add_meal_controller.dart';

class AddMealPage extends StatefulWidget {
  final String title;
  final File imageCamera;
  const AddMealPage({Key key, this.title = "Nova refeição", this.imageCamera})
      : super(key: key);

  @override
  _AddMealPageState createState() => _AddMealPageState();
}

class _AddMealPageState extends ModularState<AddMealPage, AddMealController> {
  @override
  Widget build(BuildContext context) {
    controller.image = widget.imageCamera;

    return Scaffold(
      appBar: _appBar(),
      body: Observer(builder: (_) {
        if (controller.loading) {
          return SplashPage();
        } else {
          return _body();
        }
      }),
    );
  }

  _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.redAccent,
        onPressed: () {
          Modular.to.pushReplacementNamed("/home");
        },
      ),
      title: Text(widget.title),
    );
  }

  _body() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      widget.imageCamera,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            ListTile(
              leading: Container(
                width: 30,
                height: 30,
                child: Image.asset('assets/images/platefood.png'),
              ),
              title: Observer(
                builder: (_) {
                  return InputField(
                    hint: "Adicione uma legenda...",
                    onChanged: controller.setLegend,
                    errorText: controller.errorLegend,
                    onTap: controller.setOnTapLegend,
                  );
                },
              ),
            ),
            Observer(
              builder: (_) => ListTile(
                leading: Icon(
                  Icons.access_time,
                  size: 28,
                  color: Colors.black,
                ),
                title: DropdownButton<String>(
                  value: controller.dropdownValue,
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.redAccent,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  focusColor: Colors.redAccent,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  underline: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  onChanged: (String newValue) {
                    FocusScope.of(context).requestFocus(new FocusNode());

                    controller.dropdownValue = newValue;
                  },
                  items: <String>['Café da manhã', 'Lanche', 'Almoço', 'Jantar']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 25,
                child: Observer(
                  builder: (_) => Checkbox(
                    value: controller.checkedValue,
                    onChanged: (bool value) {
                      controller.checkedValue = value;
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.redAccent,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              title: Text(
                'Exibir publicamente esta refeição?',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            FlatButton(
              onPressed: () {},
              child: FloatingActionButton.extended(
                onPressed: controller.sendMeal,
                tooltip: 'Compartilhar',
                backgroundColor: Color.fromRGBO(248, 80, 50, 0.8),
                isExtended: true,
                icon:
                    Transform.rotate(angle: pi * 1.75, child: Icon(Icons.send)),
                label: Text('Compartilhar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
