import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:respira_mobile/core/network/api_client.dart';

import 'fake_api_adapter.dart';

/// Pumps the app with an in-memory [SharedPreferences] and the offline
/// [FakeApiAdapter] so flow tests exercise real screens against canned
/// API envelopes (CI-safe).

late SharedPreferences _prefs;

Future<ProviderContainer> createTestContainer({
  String initialLocation = '/',
}) async {
  SharedPreferences.setMockInitialValues({});
  _prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(_prefs),
      apiClientProvider.overrideWithValue(
        Dio(BaseOptions(baseUrl: 'http://localhost:5016'))
          ..httpClientAdapter = FakeApiAdapter(),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}
