import 'package:flutter/material.dart';
import 'package:recipe_app/services/favorites_service.dart';
import 'package:recipe_app/widgets/meal_grid.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite recipes'),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No favouritte recipes yet.'),
            )
          : MealGrid(meals: favorites),
    );
  }
}
