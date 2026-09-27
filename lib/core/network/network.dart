import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectionStatus { connected, disconnected }

class ConnectivityService {
  ConnectivityService._internal();

  static final ConnectivityService instance = ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();

  final StreamController<ConnectionStatus> _statusController =
      StreamController<ConnectionStatus>.broadcast();

  Stream<ConnectionStatus> get onStatusChange => _statusController.stream;

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _debounce;

  void initialize() {
    _subscription = _connectivity.onConnectivityChanged.listen((_) async {
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        final result = await checkConnection();
        _statusController.add(
          result ? ConnectionStatus.connected : ConnectionStatus.disconnected,
        );
      });
    });
  }

  Future<bool> checkConnection() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      }

      return await _hasInternetAccess();
    } catch (_) {
      return false;
    }
  }

  Future<bool> _hasInternetAccess({
    String lookupAddress = 'example.com',
    Duration timeout = const Duration(seconds: 5),
  }) async {
    try {
      final result =
          await InternetAddress.lookup(lookupAddress).timeout(timeout);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _subscription?.cancel();
    _debounce?.cancel();
    _statusController.close();
  }
}
