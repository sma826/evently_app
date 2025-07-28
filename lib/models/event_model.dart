import 'package:cloud_firestore/cloud_firestore.dart';

import 'category_data_model.dart';

class EventModel {
  String id;
  String tittle;
  DateTime dateTime;
  String description;
  CategoryModel category;

  EventModel({
    required this.id,
    required this.tittle,
    required this.description,
    required this.dateTime,
    required this.category,
  });

  EventModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        category: CategoryModel.categories.firstWhere(
          (category) => category.id == json['categoryId'],
        ),
        tittle: json['tittle'],
        description: json['description'],
        dateTime: (json['timestamp'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'tittle': tittle,
    'description': description,
    'categoryId': category.id,
    'timestamp': Timestamp.fromDate(dateTime),
  };
}
