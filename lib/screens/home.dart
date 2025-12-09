import 'package:flutter/material.dart';
import 'package:recipe_app/models/category_model.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/services/api_service.dart';
import 'package:recipe_app/widgets/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];
  List<Category> filtered = [];

  bool isLoading = true;

  final ApiService api = ApiService();
  final TextEditingController search = TextEditingController();



  @override
  void initState() {
    super.initState();
    loadCategories();
  }


  void loadCategories() async 
  {
    List<Category> result = await api.getCategories();
    setState(() {
      categories = result;
      filtered = result;
      isLoading = false;
    });
  }

  void filter(String text) {
    if (text.isEmpty) {
      setState(() => filtered = categories);
      return;
    }

    setState(() {
      filtered = categories
          .where((c) => c.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void openRandom() async {
    MealDetail? meal = await api.getRandomMeal();
    if (meal != null) {
      Navigator.pushNamed(context, '/details', arguments: meal);
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        actions: [
          IconButton(
            onPressed: openRandom,
            icon: const Icon(Icons.shuffle),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: search,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search categories',
                    ),
                    onChanged: filter,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(category: filtered[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
