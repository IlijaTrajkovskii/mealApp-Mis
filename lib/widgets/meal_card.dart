import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../services/api_service.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  void openDetails(BuildContext context) async {
    ApiService api = ApiService();
    MealDetail? detail = await api.getMealDetail(meal.id);

    if (detail != null) {
      Navigator.pushNamed(context, '/details', arguments: detail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openDetails(context),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(meal.thumb, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                meal.name,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
