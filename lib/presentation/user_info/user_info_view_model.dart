import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/repository/auth_repository.dart';

class UserInfoViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  UserInfoViewModel(this._authRepository);

  GoogleSignInAccount? get currentUser => _authRepository.currentUser;

  Future<void> signOut() async {
    await _authRepository.signOut();
    notifyListeners(); // 로그아웃 후 UI 갱신
  }
}
