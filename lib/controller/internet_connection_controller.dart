import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetConnectionController extends GetxController {
  // Old method
  Future<bool> get isConnected async => await connectivity
      .checkConnectivity()
      .then((value) => !value.contains(ConnectivityResult.none));

  //New Method using GetX
  final Connectivity connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    connectivity.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          Get.rawSnackbar(
            messageText: const Text('Please check your internet connection'),
            duration: const Duration(days: 1),
            backgroundColor: Colors.red,
            isDismissible: false,
            icon: const Icon(Icons.signal_cellular_connected_no_internet_0_bar),
          );
        } else if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
      },
    );
  }
}
