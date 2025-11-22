import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal_model.dart';

class DetailData extends StatelessWidget {
  final MealDetail meal;

  const DetailData({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Instructions',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(meal.instructions),
        const SizedBox(height: 16),
        const Text(
          'Ingredients',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: meal.ingredients.map((e) => Text('- $e')).toList(),
        ),
        const SizedBox(height: 16),
        if (meal.youtubeUrl.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'YouTube link',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(meal.youtubeUrl),
            ],
          ),
      ],
    );
  }
}
