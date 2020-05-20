import 'package:flutter/foundation.dart';

class Meal {
  String userId;
  String type;
  String title;
  int rate;
  int carb;
  int prot;
  int calories;
  bool rated;

  Meal({
    @required this.userId,
    @required this.type,
    @required this.title,
    this.rate,
    this.carb,
    this.prot,
    this.calories,
    this.rated,
  });

  Meal.fromJson(Map<String, dynamic> json) {
    userId = json['user_idd'];
    type = json['type'];
    title = json['title'];
    rate = json['rate'];
    carb = json['carb'];
    prot = json['prot'];
    calories = json['calories'];
    rated = json['rated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_idd'] = this.userId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['rate'] = this.rate;
    data['carb'] = this.carb;
    data['prot'] = this.prot;
    data['calories'] = this.calories;
    data['rated'] = this.rated;
    return data;
  }
}
