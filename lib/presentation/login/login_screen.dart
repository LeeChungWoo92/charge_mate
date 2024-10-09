import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            print('abc');
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('전기차와 함께하는 모든 순간'),
            Row(
              children: [
                Text(
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
            Text(
              '지금 충전메이트에 가입하세요!',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              '전기차 충전이 더 쉽고 빨라집니다.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: SignInButton(
                Buttons.Google,
                text: '구글 계정으로 시작하기',
                onPressed:(){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
