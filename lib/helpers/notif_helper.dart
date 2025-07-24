import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:newsapp/main.dart';

Future<void> showNewsNotification(String title, String subtitle) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'news_channel_id',
    'News Notifications',
    channelDescription: 'Notifikasi untuk berita terbaru',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    subtitle,
    notificationDetails,
  );
}
