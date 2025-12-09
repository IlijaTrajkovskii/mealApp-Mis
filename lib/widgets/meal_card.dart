import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../services/api_service.dart';
import '../services/favorites_service.dart';

class MealCard extends StatefulWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = FavoritesService.isFavorite(widget.meal);
  }

  void openDetails(BuildContext context) async {
    ApiService api = ApiService();
    MealDetail? detail = await api.getMealDetail(widget.meal.id);

    if (detail != null) {
      Navigator.pushNamed(context, '/details', arguments: detail);
    }
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        FavoritesService.removeFavorite(widget.meal);
      } else {
        FavoritesService.addFavorite(widget.meal);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openDetails(context),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      widget.meal.thumb,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      color: isFavorite ? Colors.red : Colors.white,
                      onPressed: toggleFavorite,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.meal.name,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
