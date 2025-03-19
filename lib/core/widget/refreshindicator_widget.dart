import 'package:flutter/material.dart';
import '../../config/config.dart';

class BuildRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final bool Function(ScrollNotification notification)? notificationPredicate;
  final Widget child;

  const BuildRefreshIndicator({
    super.key,
    required this.onRefresh,
    this.notificationPredicate,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 100,
      color: AppColors.instance.primary,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      notificationPredicate:
          notificationPredicate ?? defaultScrollNotificationPredicate,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
