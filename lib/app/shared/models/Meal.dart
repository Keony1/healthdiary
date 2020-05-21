import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Meal {
  String images;
  String type;
  String title;
  double rating;
  double carb;
  double prot;
  double calories;
  double fat;
  bool rated;
  String uid;
  Timestamp data;

  Meal({
    this.images,
    @required this.type,
    @required this.title,
    this.rating,
    this.carb,
    this.prot,
    this.fat,
    this.calories,
    this.rated,
    this.uid,
    this.data,
  });

  Meal.fromJson(Map<String, dynamic> json) {
    images = json['images'][0];

    type = json['type'];
    title = json['title'];
    rating = json['rating'];
    carb = json['carb'];
    prot = json['prot'];
    calories = json['calories'];
    rated = json['rated'];
    uid = json['uid'];
    data = json['data'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['type'] = this.type;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['carb'] = this.carb;
    data['prot'] = this.prot;
    data['calories'] = this.calories;
    data['rated'] = this.rated;
    data['uid'] = this.uid;
    data['data'] = this.data;
    data['fat'] = this.fat;

    return data;
  }
}
