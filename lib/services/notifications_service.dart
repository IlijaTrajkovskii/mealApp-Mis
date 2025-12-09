import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
   
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint('User granted permission: ${settings.authorizationStatus}');

   
    String? token = await _messaging.getToken();
    debugPrint('FCM Token: $token');

   
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message in foreground');
      if (message.notification != null) 
      {
        debugPrint(
          'Notification: ${message.notification!.title} - ${message.notification!.body}',
        );
      }
    });

    
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) 
    {
      debugPrint('Notification was opened by the user');
     
    });
  }
}
