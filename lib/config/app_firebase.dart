// // ignore_for_file: use_build_context_synchronously
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import '../core/init/constants/app/app_constant.dart';
// import '../core/init/device/device.dart';
// import '../core/init/shared_preferences/shared_preferences.dart';
// import '../core/provider/global_provider.dart';
// import '../core/utility/formatters.dart';
// import '../main.dart';
// import 'app_local_notification_plugin.dart';
// import 'firebase_options.dart';

// class AppFirebase {
//   static Future<void> ensureInitialized() async {
//     try {
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       );

//       await FirebaseMessaging.instance.setAutoInitEnabled(true);

//       FirebaseMessaging messaging = FirebaseMessaging.instance;

//       NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: false,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );

//       await onMessageListen(settings);

//       FirebaseMessaging.onBackgroundMessage(
//           _firebaseMessagingBackgroundHandler);

//       await setFirebaseToken();

//       // await setupInteractedMessage();
//     } catch (e) {
//       debugPrint('Error => $e');
//     }
//   }

//   static Future<String?> setFirebaseToken() async {
//     final platform = AppPlatform.instance.platform;
//     String? kFcmToken;
//     if (platform == AppConstants.ANDROID) {
//       await FirebaseMessaging.instance.getToken().then((fcmToken) async {
//         kFcmToken = fcmToken;
//         debugPrint('FCM Token: $fcmToken');
//         await Singleton().setFcmToken(fcmToken ?? '');
//       });
//     } else if (platform == AppConstants.IOS && kReleaseMode) {
//       final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//       if (apnsToken != null) {
//         debugPrint('APNS Token: $apnsToken');
//         await Singleton().setApnsToken(apnsToken.toString());
//         await FirebaseMessaging.instance.getToken().then((fcmToken) async {
//           kFcmToken = fcmToken;
//           debugPrint('FCM Token: $fcmToken');
//           await Singleton().setFcmToken(fcmToken ?? '');
//         });
//         // APNS token is available, make FCM plugin API requests...
//       }
//     }
//     return kFcmToken;
//   }

//   static Future<void> onMessageListen(NotificationSettings settings) async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       BuildContext? context = navigatorKey.currentState?.context;
//       PermissionStatus? permissionNotificationStatus;
//       GlobalProvider? provider;
//       if (context != null) {
//         provider = context.read<GlobalProvider>();

//         provider.permissionNotificationStatus =
//             await Permission.notification.status;

//         permissionNotificationStatus = provider.permissionNotificationStatus;

//         if (settings.authorizationStatus == AuthorizationStatus.authorized ||
//             permissionNotificationStatus == PermissionStatus.granted) {
//         } else {
//           // if (!provider.showAlertPermissionNotification) {
//           //   provider.showAlertPermissionNotification = true;
//           //   await AppAlertDialog.submit(
//           //     context,
//           //     barrierDismissible: false,
//           //     textSubmit: 'ตั้งค่าแอป',
//           //     textCancel: 'ปิด',
//           //     title: 'การอนุญาตการแจ้งเตือนถูกปิด',
//           //     subTitle:
//           //         'กรุณาเปิดใช้งานการแจ้งเตือน เพื่อรับอัปเดตสถานะการดำเนินการ',
//           //     onPressedSubmit: () async {
//           //       await AppSettings.openAppSettings(
//           //         type: AppSettingsType.notification,
//           //       );
//           //     },
//           //   ).then((value) {
//           //     provider?.showAlertPermissionNotification = false;
//           //   });
//           // }
//         }
//       }

//       debugPrint('Message data: ${printJsonBody(message.data)}');

//       if (permissionNotificationStatus == PermissionStatus.granted) {
//         _showNotification(message);
//       }
//     });
//   }

//   @pragma('vm:entry-point')
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     // If you're going to use other Firebase services in the background, such as Firestore,
//     // make sure you call `initializeApp` before using other Firebase services.
//     await Firebase.initializeApp();

//     _showNotification(message);
//   }

//   static Future<void> setupInteractedMessage() async {
//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }

//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
//   }

//   static void _handleMessage(RemoteMessage message) {
//     debugPrint(
//       '_handleMessage => ${printJsonBody(message.toMap())}',
//     );
//   }

//   static Future<void> deleteToken() async {
//     final platform = AppPlatform.instance.platform;
//     if (platform == AppConstants.ANDROID) {
//       await FirebaseMessaging.instance.getToken().then((fcmToken) async {
//         await FirebaseMessaging.instance.deleteToken();
//       });
//     } else if (platform == AppConstants.IOS && kReleaseMode) {
//       final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//       if (apnsToken != null) {
//         await FirebaseMessaging.instance.getToken().then((fcmToken) async {
//           await FirebaseMessaging.instance.deleteToken();
//         });
//         // APNS token is available, make FCM plugin API requests...
//       }
//     }
//   }

//   static void _showNotification(RemoteMessage message) {
//     if (message.data['title'] != null || message.data['body'] != null) {
//       AppLocalNotificationPlugin.showNotification(message: message);
//     }
//   }
// }
