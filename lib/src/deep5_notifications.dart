import 'package:equatable/equatable.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// {@template notification_failure}
/// A base failure for the notification service exceptions
/// {@endtemplate}
abstract class NotificationFailure with EquatableMixin implements Exception {
  /// {@macro notification_failure}
  const NotificationFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

/// {@template initialize_failure}
/// Thrown during initialization of one signal instance
/// {@endtemplate}
class InitializeFailure extends NotificationFailure {
  ///{@macro initialize_failure}
  InitializeFailure(super.error);
}

/// {@template login_failure}
/// Thrown during login of the user to one signal instance
/// {@endtemplate}
class LoginFailure extends NotificationFailure {
  ///{@macro login_failure}
  LoginFailure(super.error);
}

/// {@template deep5_notification}
/// Serive to manage push notifications
/// {@endtemplate}
class NotificationService {
  /// {@macro deep5_notification}

  /// returns whether this app has push notification permission
  bool get permission => OneSignal.Notifications.permission;

  /// Initializes Onesignal instance based on [appId]
  Future<void> initialize({required String appId}) async {
    try {
      await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
      await OneSignal.Debug.setAlertLevel(OSLogLevel.none);
      OneSignal.initialize(appId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(InitializeFailure(error), stackTrace);
    }
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
  Future<void> login({required String externalId}) async {
    try {
      await OneSignal.login(externalId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LoginFailure(error), stackTrace);
    }
  }
}
