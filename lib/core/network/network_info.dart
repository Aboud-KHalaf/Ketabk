import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

abstract class InternetConnectivity {
  Future<bool> isConnected();
}

class InternetConnectivityImpl implements InternetConnectivity {
  final Connectivity _connectivity;

  InternetConnectivityImpl({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  @override
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      }

      final isReachable = await _isInternetReachable();
      return isReachable;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _isInternetReachable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
