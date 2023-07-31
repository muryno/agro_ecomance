
//
//
//
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//class Fcm {
//
//  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//  new FlutterLocalNotificationsPlugin();
//
//
//  getNotification(){
//    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
//    var ios = new IOSInitializationSettings();
//    var platform = new InitializationSettings(android, ios);
//    flutterLocalNotificationsPlugin.initialize(platform);
//
//    firebaseMessaging.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        print("onMessage: $message");
//        _handleNotification(message);
//      },
//      onBackgroundMessage: myBackgroundMessageHandler,
//      onLaunch: (Map<String, dynamic> message) async {
//        print("onLaunch: $message");
//        _handleNotification(message);
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("onResume: $message");
//        _handleNotification(message);
//      },
//    );
//    firebaseMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true, alert: true, badge: true));
//    firebaseMessaging.onIosSettingsRegistered
//        .listen((IosNotificationSettings setting) {
//      print('IOS Setting Registed');
//    });
//
//  }
//
//
//
//  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
//    if (message.containsKey('data')) {
//      // Handle data message
//      final dynamic data = message['data'];
//    }
//
//    if (message.containsKey('notification')) {
//      // Handle notification message
//      final dynamic notification = message['notification'];
//    }
//
//    // Or do other work.
//  }
//
//  Future<void> _handleNotification (Map<dynamic, dynamic> message) async {
//    var data = message['data'] ?? message;
//    String expectedAttribute = data['expectedAttribute'];
//    /// [...]
//  }
//}