import 'package:http/http.dart' as http;

import 'package:mobile/api/types.dart';
import 'package:mobile/auth/auth_store.dart';

class ApiClient {
  final String _baseUrl;
  final AuthStore _authStore;
  final http.Client _client;

  ApiClient(this._baseUrl, [http.Client? client]) : _client = client ?? http.Client(), _authStore = AuthStore();

  Future<CurrentUser?> getCurrentUser() async {
    var token = await _authStore.getAuthToken();
    var res = await _client.get(Uri.parse('$_baseUrl/'));

  }

}