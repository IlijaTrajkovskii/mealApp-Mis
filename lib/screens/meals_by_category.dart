import 'package:flutter/material.dart';
import 'package:recipe_app/models/category_model.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/services/api_service.dart';
import 'package:recipe_app/widgets/meal_grid.dart';


class MealsByCategoryPage extends StatefulWidget {
  const MealsByCategoryPage({super.key});

  @override
  State<MealsByCategoryPage> createState() => _MealsByCategoryPageState();
}

class _MealsByCategoryPageState extends State<MealsByCategoryPage> {
  late Category category;
  bool loaded = false;

  List<Meal> meals = [];
  List<Meal> shown = [];

  final ApiService api = ApiService();
  final TextEditingController search = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!loaded) {
      category = ModalRoute.of(context)!.settings.arguments as Category;
      loadMeals();
      loaded = true;
    }
  }

  void loadMeals() async {
    List<Meal> result = await api.getMealsByCategory(category.name);
    setState(() {
      meals = result;
      shown = result;
    });
  }

  void searchMealsByText(String text) async {
    if (text.isEmpty) {
      setState(() => shown = meals);
      return;
    }

    List<Meal> result = await api.searchMeals(text);
    setState(() {
      shown = result.where((m) => m.category == category.name).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: search,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search meals',
              ),
              onChanged: searchMealsByText,
            ),
          ),
          Expanded(
            child: MealGrid(meals: shown),
          ),
        ],
      ),
    );
  }
}
