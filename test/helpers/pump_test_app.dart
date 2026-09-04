import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:respira_mobile/core/network/api_client.dart';
import 'package:respira_mobile/core/router/app_router.dart';
import 'package:respira_mobile/main.dart';

import 'fake_api_adapter.dart';

/// Pumps the production app with mocked SharedPreferences + offline Dio,
/// starting at [initialLocation].
Future<void> pumpTestApp(
  WidgetTester tester, {
  String initialLocation = '/splash',
  Map<String, MockedResponse> overrides = const {},
}) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();

  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:5016'))
    ..httpClientAdapter = FakeApiAdapter(overrides: overrides);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        apiClientProvider.overrideWithValue(dio),
        appRouterProvider
            .overrideWithValue(buildAppRouter(initialLocation: initialLocation)),
      ],
      child: const RespiraMobileApp(),
    ),
  );
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump(const Duration(milliseconds: 100));
}

/// Lets *real* async work (Dio socket-less adapter futures) complete, then
/// flushes the frames. Dio futures don't resolve under fake async alone.
Future<void> pumpAsync(WidgetTester tester,
    {Duration realDelay = const Duration(milliseconds: 50)}) async {
  await tester.runAsync(() => Future<void>.delayed(realDelay));
  await tester.pump();
  await tester.pump();
}

/// Waits for real async work (API futures) to settle, then flushes frames.
Future<void> settleApi(WidgetTester tester) async {
  await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 150)));
  await tester.pump();
  await tester.pump();
}
