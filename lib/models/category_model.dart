import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Tomato',
        iconPath: 'assets/icons/tomato.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Potato',
        iconPath: 'assets/icons/potato.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Sugarcane',
        iconPath: 'assets/icons/sugarcane.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Apple',
        iconPath: 'assets/icons/aaple.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Rice',
        iconPath: 'assets/icons/rice.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Maize',
        iconPath: 'assets/icons/maize.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Cotton',
        iconPath: 'assets/icons/cotton.svg',
        boxColor: Colors.amber));

    categories.add(CategoryModel(
        name: 'Dates',
        iconPath: 'assets/icons/dates.svg',
        boxColor: Colors.amber));

    return categories;
  }
}
