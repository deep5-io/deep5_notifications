# Deep5 Notifications

[![License: MIT][license_badge]][license_link]

A notification Service internally used at Deep5 which wraps the OneSignal SDK.

## Installation and Configuration 💻

**❗To use OneSignal as your messaging platform follow [OneSignal documentation](https://documentation.onesignal.com/docs/flutter-sdk-setup).**

Install via `flutter pub add`:
```sh
flutter pub add deep5_notifications
```

If you are using Stacked:

```sh
 dependencies: [
        # register the service as dependency
       LazySingleton(classType: NotificationService),
  ]
```

then execute the build runner:

```sh
stacked generate
```

and start injecting the service in your viewModel:

```sh
final _notificationService = locator<NotificationService>();
```

---


[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows

