import 'package:charge_mate/presentation/user_info/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfoViewModel = context.watch<UserInfoViewModel>();
    final user = userInfoViewModel.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, // 화면 최하단에 배치
        crossAxisAlignment: CrossAxisAlignment.center, // 가로로 중앙에 배치
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await userInfoViewModel.signOut();
                print('리턴 result 로그아웃 user: $user');
                context.pop(user);
              },
              child: const Text('로그아웃'),
            ),
          ),
          const SizedBox(height: 20), // 버튼과 하단의 간격
        ],
      ),
    );
  }
}
