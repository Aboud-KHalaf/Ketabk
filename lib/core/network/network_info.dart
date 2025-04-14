import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

abstract class InternetConnectivity {
  Stream<bool> get connectivityStream;
  Future<bool> isConnected();
}

class InternetConnectivityImpl implements InternetConnectivity {
  final Connectivity _connectivity;
  final http.Client _client;

  InternetConnectivityImpl({
    Connectivity? connectivity,
    http.Client? client,
  })  : _connectivity = connectivity ?? Connectivity(),
        _client = client ?? http.Client();

  @override
  Stream<bool> get connectivityStream =>
      _connectivity.onConnectivityChanged.map((event) =>
          event.isNotEmpty && !event.contains(ConnectivityResult.none));

  @override
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.isEmpty || result.contains(ConnectivityResult.none)) {
        return false;
      }

      final response = await _client
          .get(
            Uri.parse('https://www.google.com'),
          )
          .timeout(const Duration(seconds: 5));

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
