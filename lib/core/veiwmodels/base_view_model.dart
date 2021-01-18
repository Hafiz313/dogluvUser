import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:flutter/material.dart';


class BaseViewmodel extends ChangeNotifier {
  ViewState _appState = ViewState.kIdle;
  ViewState get state => _appState;

  void setState(ViewState state) {
    _appState = state;
    notifyListeners();
  }
}