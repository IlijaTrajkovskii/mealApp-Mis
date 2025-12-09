import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

import 'package:recipe_app/screens/home.dart';
import 'package:recipe_app/screens/meals_by_category.dart';
import 'package:recipe_app/screens/details.dart';
import 'package:recipe_app/screens/favorites_page.dart';
import 'package:recipe_app/services/notifications_service.dart';



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  
  await NotificationsService.init();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/meals': (context) => const MealsByCategoryPage(),
        '/details': (context) => const DetailsPage(),
        '/favorites': (context) => const FavoritesPage(),
      },
    );
  }
}
