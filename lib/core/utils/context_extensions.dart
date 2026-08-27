import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoBackX on BuildContext {
  /// Pops when a route can be popped, otherwise navigates to [fallback].
  void goBackOr(String fallback) {
    if (canPop()) {
      pop();
    } else {
      go(fallback);
    }
  }
}
