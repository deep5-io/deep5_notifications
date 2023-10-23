import 'package:deep5_notifications/deep5_notifications.dart';
import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  group('NotificationService', () {
    late List<MethodCall> calls;
    const methodChannelName = 'OneSignal';
    const debugMethodChannelName = 'OneSignal#debug';
    const inAppMessageChannelName = 'OneSignal#inappmessages';
    const permissionsChannelName = 'OneSignal#notifications';
    const pushSubscriptionChannelName = 'OneSignal#pushsubscription';

    setUp(() {
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(pushSubscriptionChannelName),
        (call) async {
          calls.add(call);
          if (call.method == 'OneSignal#initialize') {
            return null;
          }
          return null;
        },
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(const MethodChannel(permissionsChannelName),
          (call) async {
        calls.add(call);
        if (call.method == 'OneSignal#permission') {
          return true;
        }
        return null;
      });
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(inAppMessageChannelName),
        (call) async {
          calls.add(call);
          if (call.method == 'OneSignal#initialize') {
            return null;
          }
          return null;
        },
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(methodChannelName),
        (call) async {
          calls.add(call);
          if (call.method == 'OneSignal#login') {
            return null;
          } else if (call.method == 'OneSignal#initialize') {
            return null;
          }
          return null;
        },
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(debugMethodChannelName),
        (call) async {
          calls.add(call);

          if (call.method == 'OneSignal#setLogLevel') {
            return null;
          } else if (call.method == 'OneSignal#setAlertLevel') {
            return null;
          }
          return null;
        },
      );
      locator.registerLazySingleton<NotificationService>(
        NotificationService.new,
      );
    });

    tearDown(() {
      locator.reset();
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(methodChannelName),
        (call) async => null,
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(debugMethodChannelName),
        (call) async => null,
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(inAppMessageChannelName),
        (call) async => null,
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(pushSubscriptionChannelName),
        (call) async => null,
      );
      binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel(permissionsChannelName),
        (call) async => null,
      );
    });

    test('can be instantiated via locator', () {
      expect(locator<NotificationService>(), isNotNull);
    });

    group('initialize()', () {
      test('''
          when called, should set log levels and
          initialize OneSignal instance ''', () async {
        final notificationService = locator<NotificationService>();
        calls = [];

        await notificationService.initialize(appId: 'onesignal_app_id');

        expect(
          calls,
          contains(
            isA<MethodCall>().having(
              (c) => c.method,
              'method',
              'OneSignal#setLogLevel',
            ),
          ),
        );
        expect(
          calls,
          contains(
            isA<MethodCall>().having(
              (c) => c.method,
              'method',
              'OneSignal#setAlertLevel',
            ),
          ),
        );
        expect(
          calls,
          contains(
            isA<MethodCall>().having(
              (c) => c.method,
              'method',
              'OneSignal#initialize',
            ),
          ),
        );
      });
    });

    group('login()', () {
      test('when called, should login the user to OneSignal instance', () async {
        final notificationService = locator<NotificationService>();
        calls = [];

        await notificationService.login(externalId: 'external_id');

        expect(
          calls,
          contains(
            isA<MethodCall>().having(
              (c) => c.method,
              'method',
              'OneSignal#login',
            ),
          ),
        );
      });
    });
  });
}
