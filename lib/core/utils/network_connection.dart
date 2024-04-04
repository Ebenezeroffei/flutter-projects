import 'dart:io';

class NetworkConnection {
  Future<bool> check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      throw const SocketException("No internet connection.");
    }
  }
}
