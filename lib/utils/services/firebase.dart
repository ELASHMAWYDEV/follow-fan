import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:follow_fan/utils/constants.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling background messaging: ${message.messageId}");
}

AndroidNotificationChannel channel = AndroidNotificationChannel("app_channel",
    "App Notifications", "This channel is used to handle notifications");
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> setupFirebase() async {
  await Firebase.initializeApp();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  //Get the token
  final String? token = await _firebaseMessaging.getToken();

  print("token: $token");

  //Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //Get notification permission
  NotificationSettings settings = await _firebaseMessaging.requestPermission();
  print("authurization is : ${settings.authorizationStatus}");

  /*****************************************/
  //Handle messaging
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  color: kPrimaryColor,
                  playSound: true,
                  priority: Priority.high,
                  icon: "@mipmap/ic_launcher")));
    }
  });
}






  // //Handle notifications
  // await FlutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);