import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthProvider with ChangeNotifier {
  final Ref _ref;
  AuthProvider(this._ref);

  bool _googleLoginInProgress = false;
  bool get googleLoginInProgress => _googleLoginInProgress;

  void configGoogleLoginProgress(bool val) {
    _googleLoginInProgress = val;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  bool _spotifyLoginInProgress = false;
  bool get spotifyLoginInProgress => _spotifyLoginInProgress;

  void configSpotifyLoginProgress(bool val) {
    _spotifyLoginInProgress = val;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
