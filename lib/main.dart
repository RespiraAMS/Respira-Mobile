import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'design_system/design_system.dart';

void main() {
  runApp(const ProviderScope(child: RespiraMobileApp()));
}

/// App root: Riverpod scope + Material 3 router with light/dark themes.
class RespiraMobileApp extends ConsumerWidget {
  const RespiraMobileApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'RespiraAMS',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      // themeMode: ref.watch(themeModeControllerProvider),
      themeMode: ThemeMode.light,
      routerConfig: ref.watch(appRouterProvider),
    );
  }
}
