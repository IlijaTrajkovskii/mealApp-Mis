class Meal {
  final String id;
  final String name;
  final String thumb;
  final String category;

  Meal({
    required this.id,
    required this.name,
    required this.thumb,
    required this.category,
  });

  static Meal fromFilterJson(Map<String, dynamic> json, String categoryName) {
    return Meal(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      thumb: json['strMealThumb'] ?? '',
      category: categoryName,
    );
  }

  static Meal fromSearchJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      thumb: json['strMealThumb'] ?? '',
      category: json['strCategory'] ?? '',
    );
  }
}

class MealDetail {
  final String id;
  final String name;
  final String thumb;
  final String instructions;
  final List<String> ingredients;
  final String youtubeUrl;

  MealDetail({
    required this.id,
    required this.name,
    required this.thumb,
    required this.instructions,
    required this.ingredients,
    required this.youtubeUrl,
  });

  static MealDetail fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];

    for (int i = 1; i <= 20; i++) {
      final ing = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ing != null && ing.toString().trim().isNotEmpty) {
        String full = ing.toString().trim();
        if (measure != null && measure.toString().trim().isNotEmpty) {
          full = measure.toString().trim() + " " + full;
        }
        ingredients.add(full);
      }
    }

    return MealDetail(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      thumb: json['strMealThumb'] ?? '',
      instructions: json['strInstructions'] ?? '',
      ingredients: ingredients,
      youtubeUrl: json['strYoutube'] ?? '',
    );
  }
}
