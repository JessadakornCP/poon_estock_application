// ignore_for_file: unnecessary_getters_setters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utility/utility.dart';

class BaseViewModel extends ChangeNotifier {
  bool _loadingMain = false;
  bool get loadingMain => _loadingMain;
  set loadingMain(bool value) {
    _loadingMain = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loadingPage = false;
  bool get loadingPage => _loadingPage;
  set loadingPage(bool value) {
    _loadingPage = value;
    notifyListeners();
  }

  bool _loadingSearch = false;
  bool get loadingSearch => _loadingSearch;
  set loadingSearch(bool value) {
    _loadingSearch = value;
    notifyListeners();
  }

  String? _msgError;
  String? get msgError => _msgError;
  set msgError(String? value) {
    _msgError = value;
    notifyListeners();
  }

  String? _msgSearchError;
  String? get msgSearchError => _msgSearchError;
  set msgSearchError(String? value) {
    _msgSearchError = value;
    notifyListeners();
  }

  int _pageSize = 12;
  int get pageSize => _pageSize;
  set pageSize(int value) {
    _pageSize = value;
    notifyListeners();
  }

  int _pageIndex = 1;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  int _totalPages = 0;
  int get totalPages => _totalPages;
  set totalPages(int value) {
    _totalPages = value;
    notifyListeners();
  }

  int _totalItems = 0;
  int get totalItems => _totalItems;
  set totalItems(int value) {
    _totalItems = value;
    notifyListeners();
  }

  bool _hasMoreProduct = false;
  bool get hasMoreProduct => _hasMoreProduct;
  set hasMoreProduct(bool value) {
    _hasMoreProduct = value;
    notifyListeners();
  }

  String? _isUpdateStatus;
  String? get isUpdateStatus => _isUpdateStatus;
  set isUpdateStatus(String? value) {
    _isUpdateStatus = value;
    notifyListeners();
  }

  void unfocus(BuildContext context) =>
      FocusManager.instance.primaryFocus?.unfocus();

  Future getArguments(BuildContext context) async =>
      ModalRoute.of(context)?.settings.arguments;

  bool _sendOTP = false;
  bool get sendOTP => _sendOTP;
  set sendOTP(bool value) {
    _sendOTP = value;
    notifyListeners();
  }

  int _seconds = 60;
  int get seconds => _seconds;
  set seconds(int value) => _seconds = value;

  Timer? _timer;
  Timer? get timer => _timer;
  set timer(Timer? value) => _timer = value;

  void setTimer() {
    _sendOTP = true;
    seconds = 60;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  DateTime timeBackPressed = DateTime.now();

  Future isExitWarning(BuildContext context) async {
    final difference = DateTime.now().difference(timeBackPressed);
    final isExitWarning = difference >= const Duration(seconds: 2);
    timeBackPressed = DateTime.now();
    if (isExitWarning) {
      AppSnackBar.error(
        context,
        text: 'กด BACK อีกครั้ง เพื่อออกจากแอป',
        seconds: 2,
      );
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      SystemNavigator.pop();
    }
  }

  void scrollable(BuildContext? context) async {
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
    );
  }
}
