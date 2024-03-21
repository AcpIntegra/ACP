import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ConnectivityStatus {
  static final ConnectivityStatus _obj = ConnectivityStatus._(
      StreamController<bool>.broadcast(), Connectivity(), false, false);

  ConnectivityStatus._(this.connectionController, this.connectivity,
      this._isManuallyClosed, this.isConnected);

  @mustCallSuper
  Future<void> ensureInitialized() async {
    if (_isManuallyClosed) {
      connectionController = StreamController<bool>.broadcast();
      _isManuallyClosed = false;
    }
    connectivity.onConnectivityChanged.listen(_connectionChange);
    await _getConnection();
  }

  factory ConnectivityStatus() => _obj;

  StreamController<bool> connectionController;
  final Connectivity connectivity;

  Stream<bool> get connection => connectionController.stream;

  bool isConnected;

  @nonVirtual
  bool _isManuallyClosed;

  @nonVirtual
  void controllerDispose() {
    _isManuallyClosed = true;
    connectionController.done;
    connectionController.close();
  }

  @nonVirtual
  Future<void> _getConnection() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    if (!_isManuallyClosed && connectivityResult != ConnectivityResult.none) {
      try {
        final http.Response response = await http
            .get(Uri.parse("https://dummyjson.com/products"))
            .timeout(const Duration(seconds: 5),
                onTimeout: () => http.Response('', 201));
        if (response.statusCode == 200) {
          _obj.isConnected = true;
          connectionController.sink.add(true);
        } else {
          connectionController.sink.add(false);
          _obj.isConnected = false;
        }
      } catch (e) {
        _obj.isConnected = false;
        connectionController.sink.add(false);
      }
    } else {
      _obj.isConnected = false;
      connectionController.sink.add(false);
    }
  }

  Future<bool> checkConnection() async {
    ConnectivityResult connectivityStatus =
        await connectivity.checkConnectivity();
    bool connected;
    if (connectivityStatus != ConnectivityResult.none) {
      try {
        final http.Response response = await http
            .get(Uri.parse("https://dummyjson.com/products"))
            .timeout(const Duration(seconds: 10),
                onTimeout: () => http.Response('', 201));
        connected = (response.statusCode == 200) ? true : false;
      } catch (e) {
        connected = false;
      }
    } else {
      connected = false;
    }
    isConnected = connected;
    return connected;
  }

  @nonVirtual
  void _connectionChange(ConnectivityResult result) async =>
      await _getConnection();
}
