import 'package:onesignal_flutter/onesignal_flutter.dart';

/// {@template deep5_notification}
/// Wrapper Notification Service for the OneSignal SDK
/// {@endtemplate}
class NotificationService {
  /// {@macro deep5_notification}

  /// returns whether this app has push notification [permission]
  bool get permission => OneSignal.Notifications.permission;

  /// Initializes Onesignal instance based on [appId]
  Future<void> initialize({required String appId}) async {
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    await OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize(appId);
  }

  /// Login to OneSignal under the user identified by the [externalId]
  /// provided.
  ///
  /// If the [externalId] already exists, the user will be retrieved,
  /// and the context will be set from that user information.
  /// If operations have already been performed under an anonymous user,
  /// they will not be applied to the now logged-in user,
  /// and their information will be lost.
  ///
  /// If the [externalId] does not exist, the user will be created,
  /// and the context will be set from the current local state.
  /// If operations have already been performed under an anonymous user,
  /// those operations will be applied to the newly created user.
  Future<void> login({required String externalId}) =>
      OneSignal.login(externalId);
}
