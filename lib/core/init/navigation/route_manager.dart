import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppNav {
  static void toPush(BuildContext context, {required Widget widget}) {
    // This is just a temporary solution until all direct widget navigations are replaced
    Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
  }

  static void toNamed(BuildContext context, String url, {Object? arguments}) {
    GoRouter.of(context).go(url, extra: arguments);
  }

  static void toReplacementName(
    BuildContext context,
    String url, {
    Object? arguments,
    Object? result,
  }) {
    GoRouter.of(context).pushReplacement(url, extra: arguments);
  }

  static void pop(BuildContext context, {Object? result, int count = 1}) {
    if (Navigator.canPop(context)) {
      for (var i = 0; i < count; i++) {
        GoRouter.of(context).pop(result);
      }
    }
  }

  static void popUntilWithName(BuildContext context, String url) {
    GoRouter.of(context).go(url);
  }

  static void toNameAndRemoveUntil(
    BuildContext context,
    String url, {
    Object? arguments,
  }) {
    GoRouter.of(context).go(url, extra: arguments);
  }

  // GoRouter specific helper methods

  // Navigate by name
  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(context).goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  // Push route by name
  static void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(context).pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
