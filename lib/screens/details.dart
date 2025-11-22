import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/widgets/detail_image.dart';
import 'package:recipe_app/widgets/detail_title.dart';
import 'package:recipe_app/widgets/detail_data.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetail meal =
        ModalRoute.of(context)!.settings.arguments as MealDetail;

    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DetailImage(imageUrl: meal.thumb),
            const SizedBox(height: 16),
            DetailTitle(name: meal.name),
            const SizedBox(height: 24),
            DetailData(meal: meal),
          ],
        ),
      ),
    );
  }
}
