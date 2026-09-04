import 'dart:convert';

/// Minimal JWT payload reader — extracts the `X-ID` claim (the doctor's
/// user ID) without adding a JWT package (guidelines: no extra deps
/// without permission; we only *decode*, never verify — the gateway
/// verifies signatures).
String? doctorIdFromToken(String token) {
  try {
    final parts = token.split('.');
    if (parts.length != 3) return null;
    final normalized = base64Url.normalize(parts[1]);
    final payload = utf8.decode(base64Url.decode(normalized));
    final map = jsonDecode(payload) as Map<String, dynamic>;
    return (map['X-ID'] ?? map['x-id']) as String?;
  } on FormatException {
    return null;
  }
}
