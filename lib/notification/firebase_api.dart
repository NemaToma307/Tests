
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetesting/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FireBaseApi {


  //final _fireBaseMessaging = FirebaseMessaging.instance;



                          // the old code

  //
  // void handleMessage(RemoteMessage? message) async{
  //
  //   if(message == null) return;
  //
  //   navigateKey.currentState?.pushNamed(
  //       '/note_screen', arguments: message);
  // }
  //
  // Future initPushNotifications() async {
  //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  //
  //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  // }

  // Future<void> initNotifications () async {
  //
  //
  //   await _fireBaseMessaging.requestPermission();
  //   final String? fcmToken = await _fireBaseMessaging.getToken();
  //   print('token ${fcmToken.toString()}');
  //  // FirebaseMessaging.onBackgroundMessage(handleMessage);
  //
  //   //initNotifications();
  // }

  final _fireBaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notification',
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance,
  );

  final FlutterLocalNotificationsPlugin _localNotification =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await _fireBaseMessaging.requestPermission();
    final String? fcmToken = await _fireBaseMessaging.getToken();
    print('FCM Token: $fcmToken');

    // Initialize local notifications first
    await initLocalNotifications();

    // Then initialize push notifications
    await initPushNotifications();
  }

  Future<void> handleMessageBackGround(RemoteMessage? message) async {
    if (message != null) {
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');
    }
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigateKey.currentState?.pushNamed(
      '/note_screen',
      arguments: message,
    );
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleMessageBackGround);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      notification == null ? 'null message !!' :
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.data),
      );
    });
  }

  Future<void> initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) {
        final message = RemoteMessage.fromMap(jsonDecode(payload.toString()));
        handleMessage(message);
      },
    );

    final platform = _localNotification
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }





}

//
// class FireBaseApi2 {
//   final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   final AndroidNotificationChannel _androidChannel = AndroidNotificationChannel(
//     'default_channel_id',
//     'Default Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );
//
//   Future<void> initNotifications() async {
//     // Initialize Flutter Local Notifications Plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@drawable/ic_launcher');
//
//     const InitializationSettings initializationSettings =
//     InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//
//     await _localNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: (payload) async {
//         // Handle notification tapped logic here
//         if (payload != null) {
//           print('Notification payload: $payload');
//         }
//       },
//     );
//
//     // Create notification channel for Android
//     await _localNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(_androidChannel);
//
//     // Configure Firebase Messaging
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final RemoteNotification? notification = message.notification;
//       if (notification != null) {
//         _localNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               _androidChannel.id,
//               _androidChannel.name,
//               channelDescription: _androidChannel.description,
//               icon: '@drawable/ic_launcher',
//             ),
//           ),
//           payload: message.data.toString(),
//         );
//       }
//     });
//   }
// }

