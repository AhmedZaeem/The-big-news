import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/HomeView/HomeView.dart';

class InternetConnectionController {
  Future<bool> isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }
}

connectionStream() {
  StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
      .onConnectivityChanged
      .listen((List<ConnectivityResult> result) {
    // Received changes in available connectivity types!
  });
}
