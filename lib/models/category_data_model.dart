import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: "1",
      name: "sport",
      icon: Icons.sports_baseball_rounded,
      imageName: "sport",
    ),
    CategoryModel(
      id: "2",
      name: "birthday",
      icon: Icons.cake_rounded,
      imageName: "birthday",
    ),
    CategoryModel(
      id: "3",
      name: "book club",
      icon: Icons.menu_book,
      imageName: "book club",
    ),
    CategoryModel(
      id: "4",
      name: "meeting",
      icon: Icons.work,
      imageName: "meeting",
    ),
    CategoryModel(
      id: "5",
      name: "eating",
      icon: Icons.fastfood_rounded,
      imageName: "eating",
    ),
    CategoryModel(
      id: "6",
      name: "gaming",
      icon: Icons.games_outlined,
      imageName: "gaming",
    ),
  ];
}
