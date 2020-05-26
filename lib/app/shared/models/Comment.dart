import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String comment;
  Timestamp time;
  String username;

  Comment({this.comment, this.time, this.username});

  Comment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    time = json['time'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['time'] = this.time;
    data['username'] = this.username;
    return data;
  }
}
