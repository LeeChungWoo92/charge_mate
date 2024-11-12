import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final _authStateController = StreamController<GoogleSignInAccount?>.broadcast();

  AuthRepository(this._googleSignIn) {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      _authStateController.add(account);
    });
  }

  Stream<GoogleSignInAccount?> get authStateChanges => _authStateController.stream;

  Future<GoogleSignInAccount?> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      _authStateController.add(account);
      return account;
    } catch (e) {
      print('로그인 실패: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    _authStateController.add(null);
  }

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;
}