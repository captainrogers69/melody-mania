import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers/k_providers.dart';
import '../app_providers/service_providers.dart';

abstract class BaseAuthenticationService {
  Future<void> handleLoginResponse();
  Future<void> googleSignIn();
  Future<void> signOut();
}

class AuthService implements BaseAuthenticationService {
  final Ref _ref;
  AuthService(this._ref);

  Future<GoogleSignInAccount?> initGooglesignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            // clientId: _ref.read(firebaseProvider).app.options.androidClientId,
            )
        .signIn();
    return googleUser;
  }

  /// Google login
  @override
  Future<void> googleSignIn() async {
    try {
      _ref.read(authProvider).configGoogleLoginProgress(true);
      final googleUser = await initGooglesignIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential currentUser =
            await _ref.read(firebaseProvider).signInWithCredential(credential);
        log("Google User id: ${currentUser.user!.uid}");
      } else {
        log("Google User null null");
      }

      _ref.read(authProvider).configGoogleLoginProgress(false);
    } catch (e) {
      log(e.toString());
      _ref.read(authProvider).configGoogleLoginProgress(false);
    }
  }

  @override
  Future<void> signOut() async {}

  /// common function for handling login response
  @override
  Future<void> handleLoginResponse() async {}
}
