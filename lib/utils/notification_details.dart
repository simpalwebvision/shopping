import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications_linux/flutter_local_notifications_linux.dart';

/// Contains notification details specific to each platform.
class NotificationDetails {
  /// Constructs an instance of [NotificationDetails].
  const NotificationDetails({
    this.android,
    this.iOS,
    this.linux,
  });

  /// Notification details for Android.
  final AndroidNotificationDetails? android;

  /// Notification details for iOS.
  final DarwinNotificationDetails? iOS;

  /// Notification details for Linux.
  final LinuxNotificationDetails? linux;
}
