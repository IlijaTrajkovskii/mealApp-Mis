import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recipe_app/models/category_model.dart';
import 'package:recipe_app/models/meal_model.dart';


class ApiService {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];

    final response = await http.get(
      Uri.parse('$baseUrl/categories.php'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final list = data['categories'];

      for (var item in list) {
        categories.add(Category.fromJson(item));
      }
    }

    return categories;
  }

  Future<List<Meal>> getMealsByCategory(String categoryName) async {
    List<Meal> meals = [];

    final response = await http.get(
      Uri.parse('$baseUrl/filter.php?c=$categoryName'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final list = data['meals'];

      for (var item in list) {
        meals.add(Meal.fromFilterJson(item, categoryName));
      }
    }

    return meals;
  }

  Future<List<Meal>> searchMeals(String query) async {
    List<Meal> meals = [];

    final response = await http.get(
      Uri.parse('$baseUrl/search.php?s=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final list = data['meals'];

      if (list != null) {
        for (var item in list) {
          meals.add(Meal.fromSearchJson(item));
        }
      }
    }

    return meals;
  }

  Future<MealDetail?> getMealDetail(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/lookup.php?i=$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final list = data['meals'];

      if (list != null && list.isNotEmpty) {
        return MealDetail.fromJson(list[0]);
      }
    }

    return null;
  }

  Future<MealDetail?> getRandomMeal() async {
    final response = await http.get(
      Uri.parse('$baseUrl/random.php'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final list = data['meals'];

      if (list != null && list.isNotEmpty) {
        return MealDetail.fromJson(list[0]);
      }
    }

    return null;
  }
}
