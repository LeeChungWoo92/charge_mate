import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;

  AuthRepository(this._googleSignIn);

  Future<GoogleSignInAccount?> signIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (e) {
      print('로그인 실패: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
  }

  GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;

  Future<void> signInSilently() async {
    await _googleSignIn.signInSilently();
  }
}