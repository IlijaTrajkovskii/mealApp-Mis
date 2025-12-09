// lib/services/favorites_service.dart

import 'package:recipe_app/models/meal_model.dart';

class FavoritesService {
  
  static List<Meal> favorites = [];

  static bool isFavorite(Meal meal) 
  {
    return favorites.any((m) => m.id == meal.id);
  }
  

  static void addFavorite(Meal meal) 
  {
    if (!isFavorite(meal)) {
      favorites.add(meal);
    }
  }


  static void removeFavorite(Meal meal) 
  {
    favorites.removeWhere((m) => m.id == meal.id);
  }
}
