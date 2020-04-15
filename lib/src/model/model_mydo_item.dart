import 'dart:convert';

import 'package:flutter/widgets.dart';

class MyDoItem {
  String id;
  String title;
  String body;
  int priority;
  DateTime createdAt;
  DateTime editedAt;
  DateTime dueDate;

  MyDoItem({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.priority,
    @required this.createdAt,
    this.editedAt,
    this.dueDate,
  });

  factory MyDoItem.fromRawJson(String str) => MyDoItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyDoItem.fromJson(Map<String, dynamic> json) => MyDoItem(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    priority: json["priority"],
    createdAt: DateTime.parse(json["created_at"]),
    editedAt: DateTime.parse(json["edited_at"]),
    dueDate: DateTime.parse(json["due_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "priority": priority,
    "created_at": createdAt.toIso8601String(),
    "edited_at": editedAt.toIso8601String(),
    "due_date": dueDate.toIso8601String(),
  };
}
