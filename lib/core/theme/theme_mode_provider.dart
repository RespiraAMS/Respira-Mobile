import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_provider.g.dart';

/// App brightness mode (guidelines §2.1 Riverpod codegen).
///
/// App-wide singleton (`keepAlive`) — defaults to [ThemeMode.system]; a
/// settings screen can switch to light/dark at runtime via
/// [setLight]/[setDark]/[setSystem].
@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() => ThemeMode.system;

  void setLight() => state = ThemeMode.light;

  void setDark() => state = ThemeMode.dark;

  void setSystem() => state = ThemeMode.system;
}
