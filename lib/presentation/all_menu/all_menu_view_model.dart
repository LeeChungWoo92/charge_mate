import 'package:flutter/material.dart';
import '../../data/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AllMenuViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  GoogleSignInAccount? _currentUser;

  AllMenuViewModel(this._authRepository) {
    _currentUser = _authRepository.currentUser;
    _authRepository.authStateChanges.listen((account) {
      _currentUser = account;
      notifyListeners();
    });
  }

  GoogleSignInAccount? get currentUser => _currentUser;
}
