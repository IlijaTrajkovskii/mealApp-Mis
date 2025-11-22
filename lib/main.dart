import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home.dart';
import 'package:recipe_app/screens/meals_by_category.dart';
import 'package:recipe_app/screens/details.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/meals': (context) => MealsByCategoryPage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
