import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
class ConnectionCheckerDemo extends StatefulWidget {
  const ConnectionCheckerDemo({Key? key}) : super(key: key);
  @override
  State<ConnectionCheckerDemo> createState() => _ConnectionCheckerDemoState();
}
class _ConnectionCheckerDemoState extends State<ConnectionCheckerDemo> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
              _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
          break;
        case ConnectivityResult.wifi:
          string =
              _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Offline';
      }
      // 2.
      setState(() {});
      // 3.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            string,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        backgroundColor: const Color(0xff6ae792),
      ),
      body: Center(
          child: Text(
        string,
        style: const TextStyle(fontSize: 54),
      )),
    );
  }
  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}
class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result);
    });
  }
  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }
  void disposeStream() => _controller.close();
}