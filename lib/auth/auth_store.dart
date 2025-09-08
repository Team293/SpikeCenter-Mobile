import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStore {
  static const String _AUTH_TOKEN_STORAGE_KEY = "spike_token";
  final FlutterSecureStorage _storage;

  AuthStore() : _storage = const FlutterSecureStorage();

  Future<String?> getAuthToken() async {
    return await _storage.read(key: _AUTH_TOKEN_STORAGE_KEY);
  }

  Future<void> writeAuthToken(String token) async {
    return await _storage.write(key: _AUTH_TOKEN_STORAGE_KEY, value: token);
  }
}