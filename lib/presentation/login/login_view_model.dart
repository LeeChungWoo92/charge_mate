import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/repository/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  bool _isLoading = false;

  LoginViewModel(this._authRepository);

  GoogleSignInAccount? get currentUser => _authRepository.currentUser;

  bool get isLoading => _isLoading;

  Future<void> signIn() async {
    _setLoading(true);
    try {
      await _authRepository.signIn();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
