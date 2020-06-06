import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'Comment.dart';

class Meal {
  String images;
  String type;
  String title;
  int rating;
  int carb;
  int prot;
  int calories;
  int fat;
  bool rated;
  String uid;
  Timestamp data;
  List<Comment> comments;
  String documentId;
  String nutriName;

  Meal(
      {this.images,
      @required documentId,
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
      this.comments,
      this.nutriName});

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
    comments = json['comments'];
    documentId = json['documentId'];
    nutriName = json['nutriName'];
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
    data['comments'] = this.comments.map((comment) => comment.toJson());
    data['documentId'] = this.documentId;
    data['nutriName'] = this.nutriName;

    return data;
  }
}
