import 'package:charge_mate/presentation/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();
    final user = loginViewModel.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('전기차와 함께하는 모든 순간'),
            Row(
              children: [
                const Text(
                  '충전메이트',
                  style: TextStyle(
                    color: Colors.blue,
                    fontStyle: FontStyle.normal,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/icons/ic_bolt.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              '지금 충전메이트에 가입하세요!',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const Text(
              '전기차 충전이 더 쉽고 빨라집니다.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            if (loginViewModel.isLoading) const Center(child: CircularProgressIndicator()),
            if (!loginViewModel.isLoading)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: SignInButton(
                  Buttons.Google,
                  text: '구글 계정으로 시작하기',
                  onPressed: () async {
                    await loginViewModel.signIn();
                    context.pop(user);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
